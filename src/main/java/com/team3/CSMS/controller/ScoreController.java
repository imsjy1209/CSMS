package com.team3.CSMS.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3.CSMS.model.Score;
import com.team3.CSMS.service.ScoreService;

@Controller
public class scoreController {

	@Autowired
	private ScoreService scoreService;

	// 顯示頁面
	@GetMapping("/score")
	public String showScoreIndexAjax() {
		return "/cs_score/score";
	}
	// 找全部score
	@GetMapping("/findAllScore.controller")
	public @ResponseBody List<Score> findAll() {
		return scoreService.findAllScore();
	}

	// 更改score

	@GetMapping("/scoreData/edit")
	public String editScore(@RequestParam(name = "id") Integer id, Model model) {
		Score score1 = scoreService.findScoreById(id);
		model.addAttribute("score1", score1);
		return "cs_score/scoreUpdate";

	}
	
	//建立
		@PostMapping("scoreDataCreate.controller")
		public String scoreCreateAction
		(@RequestParam(name="score", required = true) int score)
		{
		 
			Score score1 = new Score();
//			try {
//				score1.setScore(score);
//				
//				scoreService.insertScore(score1);
//				return "redirect:/roomCreate.page";
//			} catch (IOException e) {
//				e.printStackTrace();
//				redirectAttributes.addFlashAttribute("errorMsg", "上傳失敗，請重新上傳");
//				return " ";
//			}
			return "cs_score/scoreEdit";}
		
		
		
		//更新score
		@PostMapping("/scoreDataUpdateAAA")
		public String scoreUpdateAction
		(@RequestParam(name="scoreId", required = true) int id,
		 @RequestParam(name="score", required = true) int score
//		 @RequestParam(name="fk_student_id", required = true) String fk_student_id,
//		 @RequestParam(name="fk_classlist_id", required = true) String fk_classlist_id,
//		 @RequestParam(name="fk_school_id", required = true) String fk_school_id,
		// @RequestParam(name="fk_parent_id", required = true) String fk_parent_id,
		// @RequestParam(name="fk_teacher_id", required = true) String fk_teacher_id
//		 RedirectAttributes redirectAttributes
		 ) {
			

			
			Score oldScore = scoreService.findScoreById(id);
			oldScore.setScore(score);
			System.out.println("testtttt");
			
			
				scoreService.insertScore(oldScore);
				
				return "redirect:/score";
			
			
		}
		

		
		
		//刪除教室資料
		@GetMapping("/scoreData/delete")
		public String deleteRoom(@RequestParam(name="id") Integer id) {
			Score score1 = scoreService.findScoreById(id);
			scoreService.deleteScore(score1);
			return "redirect:/findAllScore.controller";
		}
}
