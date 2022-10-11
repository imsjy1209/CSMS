package com.team3.CSMS.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import javax.swing.text.AbstractDocument.Content;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.model.Room;
import com.team3.CSMS.service.RoomService;


@Controller
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	
	//教室建立Room
	@PostMapping("roomDataCreate.controller")
	public String roomCreateAction
	(@RequestParam(name="roomName", required = true) String roomName,
	 @RequestParam(name="roomSize", required = true) int roomSize,
	 @RequestParam(name="roomPic") MultipartFile file,RedirectAttributes redirectAttributes) {
		Room room1 = new Room();
		try {
			room1.setRoomName(roomName);
			room1.setRoomSize(roomSize);
			room1.setRoomPic(file.getBytes());
			roomService.insertRoom(room1);
			return "redirect:/roomCreate.page";
		} catch (IOException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("errorMsg", "上傳失敗，請重新上傳");
			return "redirect:/roomCreate.page";
		}
	}
	
	//教室更新Room
	@PostMapping("roomDataUpdateAAA")
	public String roomUpdateAction
	(@RequestParam(name="roomId", required = true) int id,@RequestParam(name="roomName", required = true) String roomName,
	 @RequestParam(name="roomSize", required = true) int roomSize,
	 @RequestParam(name="roomPic") MultipartFile file,RedirectAttributes redirectAttributes) {
		
		Room oldRoom = roomService.findRoomById(id);
		System.out.println("testtttt");
		try {
			oldRoom.setRoomName(roomName);
			oldRoom.setRoomSize(roomSize);
			byte[] newByte = file.getBytes();
			
			System.out.println(newByte);
			
			if(newByte.length!=0){
			
			oldRoom.setRoomPic(newByte);
			}
			roomService.insertRoom(oldRoom);
			return "redirect:/roomCreate.page";
		} catch (IOException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("errorMsg", "上傳失敗，請重新上傳");
			return "redirect:/roomCreate.page";
		}
	}
	
	//找全部教室
	@GetMapping("/findAllRoom.controller")
	public String findAllRoom(Model model) {
		 List<Room> roomList = roomService.findAllRoom();
		 model.addAttribute("roomList", roomList);
		 return "cs_room/roomIndex";
	}
	
	//找全部教室-Ajax
	@GetMapping("/findAllRoomAjax.controller")
	public @ResponseBody List<Room> findAllRoomAjax(Model model) {
		 List<Room> roomList = roomService.findAllRoom();
		 return roomList;
	}
	
	//教室總total頁面--圖片(for後台)
	@GetMapping("AllRoomPic/{id}")
	public ResponseEntity<byte[]> downloadImage(@PathVariable Integer id){
		Room Room1 = roomService.getRoomPicById(id);
		byte[] photoFile = Room1.getRoomPic();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		// 資料, header, HttpStatus
		return new ResponseEntity<byte[]>(photoFile, headers, HttpStatus.OK);
	}
	
	//更改教室資料
	@GetMapping("/roomData/edit")
	public String editRoom(@RequestParam(name="id") Integer id, Model model ) {
		Room room1 = roomService.findRoomById(id);
		
		model.addAttribute("room1", room1);
		return "cs_room/roomUpdate";
	}
	
	//刪除教室資料
	@GetMapping("/roomData/delete")
	public String deleteRoom(@RequestParam(name="id") Integer id) {
		Room room1 = roomService.findRoomById(id);
		roomService.deleteRoom(room1);
		return "redirect:/findAllRoom.controller";
	}
}
