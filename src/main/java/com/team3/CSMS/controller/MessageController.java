package com.team3.CSMS.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.team3.CSMS.model.ClassStudentList;
import com.team3.CSMS.model.Messagez;
import com.team3.CSMS.model.Parent;
import com.team3.CSMS.model.School;
import com.team3.CSMS.model.Student;
import com.team3.CSMS.model.Teacher;
import com.team3.CSMS.service.MessageService;
import com.team3.CSMS.service.ParentService;
import com.team3.CSMS.service.SchoolService;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService mSer;
	@Autowired
	private SchoolService sSer;
	@Autowired
	private ParentService pSer;
	
	@GetMapping("message")
	public String test() {
		return "message/messagez";
	}
	
	@GetMapping("/message/getteacher")
	public @ResponseBody List<String> getschool(@SessionAttribute("parent") Parent parent){
		List<Student> students = parent.getStudent();
		Student student = students.get(0);;
		List<String> list = mSer.findschoolname(student.getId());
		System.out.println(student.getId());
//		School school= students.get(0).getClassStudentLists().get(0).getClassList().getSchool();
//		System.out.println(school.getName());
		return list;
	}
	
	@PostMapping("message/addMessageByParent")
	public String sendMessageByParent(@SessionAttribute("parent") Parent parent,
			@RequestParam("school") String name,
			@RequestParam("topic") String topic,
			@RequestParam("article") String article,
			@RequestParam("type") String type) {
		School school = sSer.getTeacherByName(name);
		Messagez messagez = new Messagez(parent,school,0,type,topic,article);
		mSer.insert(messagez);
		return"redirect:/message/getallByParent";
	}
	@PostMapping("message/addMessageBySchool")
	public String sendMessageBySchool(@SessionAttribute("school") School school,
			@RequestParam("parentid") int id,
			@RequestParam("titleOfMsg") String titleOfMsg,
			@RequestParam("article") String article,
			@RequestParam("typeOfMsg") String typeOfMsg) {
		Parent parent = pSer.findById(id);
		Messagez messagez = new Messagez(parent,school,1,typeOfMsg,titleOfMsg,article);
		mSer.insert(messagez);
		return"redirect:/messageForSchool.controller";
	}
	@GetMapping("message/getallBySchool")
	public String getallBySchool(@SessionAttribute("school")School school,Model m) {		
		List<Messagez> list = mSer.getAllBySchool(school);
		m.addAttribute("list",list);
		return "message/school//getallbyschool";
	}
	
	//=========Neil 1103================================
	@GetMapping("/messageForSchool.controller")
	public String messageForSchool(@SessionAttribute("school")School school,Model m) {		
		List<Messagez> list = mSer.findBySchoolIsOrderByCreateTimeDesc(school);
		
		m.addAttribute("list",list);
		return "cs_message/getMessageForSchool";
	}
	//=========End of Neil 1103================================
	
	@GetMapping("message/getallByParent")
	public String getallByParent(@SessionAttribute("parent")Parent parent,Model m) {		
		List<Messagez> list = mSer.getAllByParent(parent);
		m.addAttribute("list",list);
		return "message/parent/getallbyparent";
	}
	
	@GetMapping("message/viewmessage")
	public String viewmessage(@RequestParam int id,Model m) {
		Messagez messagez = mSer.findById(id);
		m.addAttribute("message",messagez);
		return "message/school/messagedetail";
	}
	@GetMapping("message/viewmessagebyparent")
	public String viewmessagebyparent(@RequestParam int id,Model m) {
		Messagez messagez = mSer.findById(id);
		m.addAttribute("message",messagez);
		return "message/parent/messagedetailbyparent";
	}
	
//	@GetMapping("/a")
//	public String scoreEdit() {
//		return "/cs_score/scoreEdit";
//	}
	
	//已讀方法
	@GetMapping("message/readornot")
	public @ResponseBody Messagez readornot(@RequestParam("id")int id) {
		Messagez messagez = mSer.readornot(id);
		return messagez;
	}
	
	
}
