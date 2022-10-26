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
import com.team3.CSMS.model.School;
import com.team3.CSMS.model.Teacher;
import com.team3.CSMS.service.ClassListService;
import com.team3.CSMS.service.RoomService;
import com.team3.CSMS.service.SchoolService;
import com.team3.CSMS.service.TeacherService;

@Controller
public class ClassListController {
	
	@Autowired
	private ClassListService classListService;
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private SchoolService schoolService;
	
	@Autowired
	private TeacherService teacherService;
	
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
		
		//更改課程班導資料
		@GetMapping("/updateClssListSchoolDataAjax.controller")
		public @ResponseBody void updateClssListSchoolDataAjax
		(@RequestParam(name="classListId")Integer cLid,@RequestParam(name="schoolId")Integer schoolId) {
			School aSchool = schoolService.findSchoolById(schoolId);
			
			ClassList aClassList = classListService.findClassListById(cLid);
			aClassList.setSchool(aSchool);
			
			classListService.insertClassList(aClassList);
		}
		
		//更改課程教師資料
		@GetMapping("/updateClssListTeacherDataAjax.controller")
		public @ResponseBody void updateClssListTeacherDataAjax
		(@RequestParam(name="classListId")Integer cLid,@RequestParam(name="teacherId")Integer teacherId) {
			Teacher aTeacher = teacherService.findTeacherById(teacherId);
			ClassList aClassList = classListService.findClassListById(cLid);
			aClassList.setTeacher(aTeacher);
			
			classListService.insertClassList(aClassList);
		}	
		
		//更改課程已報名人數
		@GetMapping("/updateClssListMemberDataAjax.controller")
		public @ResponseBody void updateClssListMemberDataAjax
		(@RequestParam(name="clId")Integer clId,@RequestParam(name="clMemVal")Integer clMemVal) {
			ClassList oneClassList = classListService.findById(clId);
			oneClassList.setClassMember(clMemVal);
			classListService.insertClassList(oneClassList);
		}	
		
		// find ClassList And ClassStudentList By ClassListId
		@GetMapping("/findClassListByIdAjax.controller")
		public @ResponseBody ClassList findClassListByIdAjax(@RequestParam(name="classListId")Integer classListId) {
			ClassList oneClassList = classListService.findById(classListId);
			 return oneClassList;
		}		

}
