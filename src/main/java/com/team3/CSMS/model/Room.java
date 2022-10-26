package com.team3.CSMS.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;

@Entity
@Table(name="Room")
public class Room {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="room_id")
	private Integer id;
	
	@Column(name="roomname",columnDefinition = "nvarchar(10)", nullable = false)
	private String roomName;

	@Column(name="roomsize", nullable = false)
	private int roomSize;
	
	@Column(name="roompic")
	private byte[] roomPic;
	
	public Room() {
	}
	
	public byte[] getRoomPic() {
		return roomPic;
	}

	public void setRoomPic(byte[] roomPic) {
		this.roomPic = roomPic;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getRoomSize() {
		return roomSize;
	}

	public void setRoomSize(int roomSize) {
		this.roomSize = roomSize;
	}

}