package com.team3.CSMS.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.CSMS.model.Expense;
import com.team3.CSMS.service.ExpenseService;

@Controller
public class ExpenseController {

	@Autowired
	private ExpenseService eSer;

	@GetMapping(path = "/expenseform")
	public String expenseform(Model m) {
		Expense exp = new Expense();
		m.addAttribute("expense", exp);
		return "expenseform2";
	}
	
	@GetMapping("/addExpense")
	public String createExp(@RequestParam String year,
			@RequestParam String semester,
			@RequestParam int income,
			@RequestParam int totalcost,
			@RequestParam int markting,
			@RequestParam int personnel,
			@RequestParam int other,
			Model m) {
		Expense exp = new Expense(year,semester,income,totalcost,markting,personnel,other);
		eSer.insert(exp);
		m.addAttribute("message","新增成功");
		return "expenseform2";
	}
	
	@GetMapping("/expense/edit")
	public String edit(@RequestParam int id,
			@RequestParam String year,
			@RequestParam String semester,
			@RequestParam int income,
			@RequestParam int totalcost,
			@RequestParam int markting,
			@RequestParam int personnel,
			@RequestParam int other,
			Model m) {
		Expense exp = new Expense(id,year,semester,income,totalcost,markting,personnel,other);
		eSer.insert(exp);
		m.addAttribute("message","更新成功");
		return "expenseform2";
	}
	
	@GetMapping("/expense/all")
	public @ResponseBody List<Expense> first() {

		return eSer.getAll();
	}

	@GetMapping("/expense/{id}")
	public @ResponseBody Expense getone(@PathVariable int id) {

		return eSer.findById(id);
	}

	@GetMapping("/trypage")
	public String home() {

		return "chart/try";
	}

	@GetMapping("/expense/selectdate")
	public @ResponseBody Expense getone(@RequestParam String year, @RequestParam String semester) {
		Expense expense = new Expense();
		Expense data = eSer.findBydate(year, semester);
		if(data == null) {
			return expense;
		}
		return data;
	}

	@GetMapping("/expense/getyear")
	public @ResponseBody List<Expense> showyear(@RequestParam String first, @RequestParam String second) {
		return eSer.findExpByYear(first, second);
	}

	@GetMapping("/expense/getAllyear")
	public @ResponseBody List<String> showallyear() {
		System.out.println("come");
		return eSer.getAllYear();
	}
//	@GetMapping("/expense/coursenum")
//	public @ResponseBody List<String> couresnum(){
//		List<String> map = eSer.coursenum();
//		System.out.println(map);
//		return map;
//	}
}
