package com.team3.CSMS.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team3.CSMS.model.Post;
import com.team3.CSMS.service.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService pser;

	@GetMapping("/post/postform")
	public String postform() {
		return "post/postform";
	}
	@GetMapping("post/detail/{id}")
	public String postdetail(@PathVariable int id,Model m) {
		Post post = pser.findById(id);
		m.addAttribute("post",post);
		return "post/postdetail";
	}
	
	@PostMapping("/post/add")
	public String add(@RequestParam("topic") String topic,
			@RequestParam("userType") int userType,
			@RequestParam("article") String article) {
		Post post = new Post(userType,topic,article);
		pser.insert(post);
		return "homepage";
	}
	@GetMapping("post/getall")
	public String getAll(Model m) {
		List<Post> list = pser.getAll();
		m.addAttribute("list",list);
		return "post/postgetallman";
	}
	
	@GetMapping("/post/updatepage/{id}")
	public String update(@PathVariable int id, Model m) {
		Post post = pser.findById(id);
		m.addAttribute("post",post);
		m.addAttribute("id",post.getId());
		m.addAttribute("post",post);
		return "post/postupdate";
	}
	
	@PostMapping("/post/update")
	public String updateCkeditor(@RequestParam("id") int id,
			@RequestParam("topic") String topic,
			@RequestParam("userType") int userType,
			@RequestParam("article") String article
			, Model m) throws ParseException {
//		System.out.println(place+name);
//		System.out.println(id);
//		System.out.println(date);
//		Activity activity = aService.findById(id);
		Post post = pser.findById(id);
		post.setTopic(topic);
		post.setUserType(userType);
		post.setArticle(article);
		post.setUpdate_at(new Date());
		pser.insert(post);
		return "redirect:/post/getall";
	}
	@GetMapping("post/already/{id}")
	public String already(@PathVariable int id) {
		pser.already(id);
		return "redirect:/post/getall";
	}
	
	@GetMapping("post/removed/{id}")
	public String removed(@PathVariable int id) {
		pser.removed(id);
		return "redirect:/post/getall";
	}
	@GetMapping("post/viewbyschool")
	public String viewbyschool(Model m) {
		List<Post> list = pser.viewAllBySchool();
		m.addAttribute("list",list);
		return "post/viewpostbySchool";
	}
	@GetMapping("post/viewbyall")
	public String viewbyall(Model m) {
		List<Post> list = pser.viewAllByAll();
		m.addAttribute("list",list);
		return "post/viewpostbyAll";
	}
}
