package com.team3.CSMS.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.RoomDao;
import com.team3.CSMS.model.Room;

@Service
@Transactional
public class RoomService {
	
	@Autowired
	private RoomDao roomDao;
	
	//新增教室
	public void insertRoom(Room room) {
		roomDao.save(room);
	}
	
	//刪除教室
	public void deleteRoom(Room room) {
		roomDao.delete(room);
	}
	
	//找教室ById
	public Room findRoomById(int id) {
		Optional<Room> room1 = roomDao.findById(id);
		Room aRoom = room1.get();
		return aRoom;
	}
	
	//找全部教室
	public List<Room> findAllRoom() {
		List<Room> roomList = roomDao.findAll();
		return roomList;
	}
	
	//找教室圖片
	public Room getRoomPicById(Integer id) {
		Optional<Room> op = roomDao.findById(id);
		if(op.isPresent()) {
			return op.get();
		}
		return null;
	}
	

}
