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
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	//========PostController-Neil 1024===============================================
	@GetMapping("/showAllPost.controller")
	public String showAllPost(Model m) {
		List<Post> list = pser.getAll();
		m.addAttribute("list", list);
		return "cs_post/allPostPage";
	}
	
	//=====編輯按鈕跳轉用======
	@GetMapping("/updatePost/{id}")
	public String updatePost(@PathVariable int id, Model m) {
		Post post = pser.findById(id);
		m.addAttribute("post", post);
		m.addAttribute("id", post.getId());
		m.addAttribute("post", post);
		return "cs_post/postUpdatePage1";
	}
	
	//=====編輯後Submit跳轉用======
	@PostMapping("/updatePostFin")
	public String updatePostFin(@RequestParam("id") int id, @RequestParam("topic") String topic,
			@RequestParam("userType") int userType, @RequestParam("article") String article, Model m)
			throws ParseException {
		Post post = pser.findById(id);
		post.setTopic(topic);
		post.setUserType(userType);
		post.setArticle(article);
		post.setUpdate_at(new Date());
		pser.insert(post);
		return "redirect:/showAllPost.controller";
	}
	
	//====公告上下架-Ajax============
	@ResponseBody
	@GetMapping("/postChangeToOn")
	public void postChangeToOn(@RequestParam int id) {
		pser.already(id);
	}
	@ResponseBody
	@GetMapping("/postChangeToOff")
	public void postChangeToOff(@RequestParam int id) {
		pser.removed(id);
	}
	
	@PostMapping("/postCreate")
	public String postCreate(@RequestParam("topic") String topic, @RequestParam("userType") int userType,
			@RequestParam("article") String article) {
		Post post = new Post(userType, topic, article);
		pser.insert(post);
		System.out.println("==============================");
		System.out.println("==============================");
		System.out.println("==============================");
		System.out.println("==============================");
		System.out.println("==============================");
		// return "redirect:/createPost.controller";
		return "redirect:/showAllPost.controller";
	}
	
	
	
	//========End Of PostController-Neil 1024========================================

	@GetMapping("post/detail/{id}")
	public String postdetail(@PathVariable int id, Model m) {
		Post post = pser.findById(id);
		m.addAttribute("post", post);
		return "post/postdetail";
	}

	//
	@PostMapping("/post/add")
	public String add(@RequestParam("topic") String topic, @RequestParam("userType") int userType,
			@RequestParam("article") String article) {
		Post post = new Post(userType, topic, article);
		pser.insert(post);
		return "activity/homepage";
	}

	@GetMapping("post/getall")
	public String getAll(Model m) {
		List<Post> list = pser.getAll();
		m.addAttribute("list", list);
		return "post/postgetallman";
	}

	@GetMapping("/post/updatepage/{id}")
	public String update(@PathVariable int id, Model m) {
		Post post = pser.findById(id);
		m.addAttribute("post", post);
		m.addAttribute("id", post.getId());
		m.addAttribute("post", post);
		return "post/postupdate";
	}

	@PostMapping("/post/update")
	public String updateCkeditor(@RequestParam("id") int id, @RequestParam("topic") String topic,
			@RequestParam("userType") int userType, @RequestParam("article") String article, Model m)
			throws ParseException {
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
		m.addAttribute("list", list);
		return "post/viewpostbySchool";
	}

	// 【所有人】公告查詢
	@GetMapping("post/viewbyall")
	public String viewbyall(Model m) {
		List<Post> list = pser.viewAllByAll();
		m.addAttribute("list", list);
		return "post/viewpostbyAll";
	}
	
	
	//===for 建立公告的頁面========
	@GetMapping("/createPost.controller")
	public String createPost(Model m) {
		return "cs_post/createPostPage";
	}
}