package com.team3.CSMS.dto;

import java.io.Serializable;

// 預想：選定聯絡簿系統的下拉選單項目後，回傳ClassListId，搭配sessionAccount，套用在ContactBookList的Json中
public class InputSelectedClassListIdDto implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String SelectedClassListId;
	
	public InputSelectedClassListIdDto() {
		
	}

	public String getSelectedClassListId() {
		return SelectedClassListId;
	}

	public void setSelectedClassListId(String selectedClassListId) {
		SelectedClassListId = selectedClassListId;
	}
	
}
