package com.team3.CSMS.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3.CSMS.model.Activity;
import com.team3.CSMS.model.Student;
import com.team3.CSMS.service.ActivityService;
import com.team3.CSMS.service.StudentService;

@SessionAttributes(names = { "student" })
@Controller
public class ActivityController {

	@Autowired
	private ActivityService aService;

	@Autowired
	private StudentService sService;
//	private Student student=sService.findById(1);

	@GetMapping("/getAllstu")
	public String getAllstu(Model m) {
		Activity activity = aService.findById(92);
		System.out.println(activity);

		Set<Student> students = activity.getStudents();
		m.addAttribute("list", students);

		return "getAllstu";
	}

//	@PostMapping("/updateallstu")
//	public String updateallstu() {
//		
//	}

	@GetMapping(path = "/activitymain.controller")
	public String processMainAction(Model m) {
//		if (student != null) {
//			System.out.println(student.getGrade() + student.getName());
//		}
		Activity act = new Activity();
		m.addAttribute("activity", act);
		return "activity/activityform";
	}

	@GetMapping(path = "homepage.controller")
	public String goHomePage(Model m) {
		return "activity/homepage";
	}

	@PostMapping("/addActivity")
	public String createAct(@ModelAttribute("Activity") Activity act, BindingResult result, Model m) {
		if (result.hasErrors()) {
			return "membersError";
		}
		aService.insert(act);
		m.addAttribute("id", act.getId());
		return "activity/addphoto";
	}

	@PostMapping("/addActivityByCkeditor")
	public String createActByCkeditor(@RequestParam("name") String name, @RequestParam("place") String place,
			@RequestParam("date") String strdate, @RequestParam("content") String content, Model m)
			throws ParseException {
		java.text.SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = formatter.parse(strdate);
		Activity activity = new Activity(name, place, date, content);
		aService.insert(activity);
		m.addAttribute("id", activity.getId());
		return "activity/addphoto";
	}

	@GetMapping("updatepic/{id}")
	public String updatepic(@PathVariable int id, Model m) {
		m.addAttribute("id", id);
		return "activity/addphoto";
	}

	@PostMapping("/addActivityPhoto")
	public String addPhoto(@RequestParam(name = "id", required = true) int id,
			@RequestParam(name = "file") MultipartFile file, RedirectAttributes redirectAttributes, Model m) {
		Activity activity = aService.findById(id);
		try {
			activity.setPhoto_file(file.getBytes());
			aService.insert(activity);
			return "homepage";
		} catch (IOException e) {
			e.printStackTrace();
			m.addAttribute("id", id);
			redirectAttributes.addFlashAttribute("errorMsg", "上傳失敗，請重新上傳");
			return "activity/addphoto";
		}
	}

	@PostMapping("/update")
	public String update(@ModelAttribute("Activity") Activity act, BindingResult result, Model m) {
//		System.out.println(place+name);
//		System.out.println(id);
//		System.out.println(date);
//		Activity activity = aService.findById(id);
		if (result.hasErrors()) {
			return "membersError";
		}
		Activity activity = aService.findById(act.getId());
		activity.setName(act.getName());
		activity.setPlace(act.getPlace());
		activity.setDate(act.getDate());
		activity.setContent(act.getContent());
		aService.insert(act);
		return "activity/homepage";
	}

	@GetMapping("downloadImage/{id}")
	public ResponseEntity<byte[]> downloadImage(@PathVariable Integer id) {
		Activity activity = aService.findById(id);
		byte[] photoFile = activity.getPhoto_file();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		return new ResponseEntity<byte[]>(photoFile, headers, HttpStatus.OK);
	}

	@GetMapping("/getAll")
	public String getAll(Model m) {

		List<Activity> list = aService.getAll();
		m.addAttribute("list", list);

		return "activity/getAll";
	}

	@GetMapping("/getAllman")
	public String getAllman(Model m) {

		List<Activity> list = aService.findAll();
		m.addAttribute("list", list);

		return "activity/activitygetallman";
	}

	@GetMapping("/getAllajax")
	public @ResponseBody List<Activity> getAllajax() {

		return aService.getAll();
	}

	@GetMapping("/delete/{id}")
	public String delete(@PathVariable int id) {
		System.out.println(id);
		aService.delete(id);
		return "redirect:/getAll";
	}

	@GetMapping("/updatepage132/{id}")
	public String updatepage(@PathVariable int id, Model m) {
		Activity act = new Activity();
		act.setId(id);
		m.addAttribute("activity", act);
		System.out.println(act.getId());
		return "updatepage1";
	}

	@GetMapping("/join/{act_id}")
	public String joinact(@PathVariable int act_id, @SessionAttribute("student") Student student) {
		System.out.println(act_id + "" + student);
		aService.join(act_id, student);
		return "activity/checkjoin";
	}

	@GetMapping("/quit/{act_id}")
	public String quitact(@PathVariable int act_id, @SessionAttribute("student") Student student) {
		aService.quit(act_id, student.getId());
		return "activity/checkquit";
	}

	@GetMapping("/createstu")
	public String createstu(Model m) {
		Student student = sService.findStudentById(1);
		m.addAttribute("student", student);
		System.out.println(student.getGrade() + student.getName());
		return "activity/createstu";
	}

	@GetMapping("/deletestu")
	public String deletestu(SessionStatus status) {
		status.setComplete();
		return "activity/deletestu";
	}

	@GetMapping("/newfile")
	public String newfile() {
		return "ajax-message";
	}

	@GetMapping("/getact/{id}")
	public @ResponseBody Activity findByidajax(@PathVariable int id) {
		return aService.findById(id);
	}

	@GetMapping("/getact")
	public String findByid(@RequestParam int id, Model m) {
		Activity activity = aService.findById(id);
		m.addAttribute("act", activity);
		return "activity/activitydetail";
	}

	@GetMapping("/updatepage/{id}")
	public String update(@PathVariable int id, Model m) {
		Activity activity = aService.findById(id);
		m.addAttribute("id", activity.getId());
		m.addAttribute("removed", activity.getRemoved());
		m.addAttribute("activity", activity);
		return "activity/activitydetailupd2";
	}

	@PostMapping("/updateCkeditor")
	public String updateCkeditor(@RequestParam("id") int id, @RequestParam("name") String name,
			@RequestParam("place") String place, @RequestParam("date") String strdate,
			@RequestParam("content") String content, Model m) throws ParseException {
//		System.out.println(place+name);
//		System.out.println(id);
//		System.out.println(date);
//		Activity activity = aService.findById(id);

		Activity activity = aService.findById(id);
		activity.setName(name);
		activity.setPlace(place);
		java.text.SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = formatter.parse(strdate);
		activity.setDate(date);
		activity.setContent(content);
		aService.insert(activity);
		return "activity/homepage";
	}

	@GetMapping("/already/{id}")
	public String already(@PathVariable int id) {
		aService.already(id);
		return "redirect:/getAllman";
	}

	@GetMapping("/removed/{id}")
	public String removed(@PathVariable int id) {
		aService.removed(id);
		return "redirect:/getAllman";
	}

	@GetMapping("/getmyact")
	public String getMyAct(@SessionAttribute("student") Student student, Model m) {
		Set<Activity> activities = sService.getMyAct(student.getId());
		m.addAttribute("activities", activities);
		return "activity/shommyactivity";
	}

	@GetMapping("getmyact/getact")
	public String getMyActfindByid(@RequestParam int id, Model m) {
		Activity activity = aService.findById(id);
		m.addAttribute("act", activity);
		return "activity/activitydetailgetMyAct";
	}

	@GetMapping("activity/search")
	public @ResponseBody List<Activity> search(@RequestParam String name) {
		return aService.search(name);
	}
}
