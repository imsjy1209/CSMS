package com.team3.CSMS.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.model.Room;
import com.team3.CSMS.service.ClassListService;
import com.team3.CSMS.service.RoomService;

@Controller
public class ClassListController {
	
	@Autowired
	private ClassListService classListService;
	
	@Autowired
	private RoomService roomService;
	
	//顯示頁面
	@GetMapping("/classListIndexAjax")
	public String showClassListIndexAjax() {
		 return "cs_classList/classListIndexAjax";
	}
	
	//找全部課程
		@GetMapping("/findAllClassListAjax.controller")
		public @ResponseBody List<ClassList> findAllClssList(Model model) {
			 List<ClassList> classListList = classListService.findAllClassList();
			 return classListList;
		}
	//更改課程教室資料
		@GetMapping("/updateClssListRoomDataAjax.controller")
		public @ResponseBody void updateClssListRoomDataAjax
		(@RequestParam(name="classListId")Integer cLid,@RequestParam(name="roomId")Integer rid) {
			Room aRoom = roomService.findRoomById(rid);
			
			ClassList aClassList = classListService.findClassListById(cLid);
			aClassList.setRoom(aRoom);
			
			classListService.insertClassList(aClassList);
		}	

}
