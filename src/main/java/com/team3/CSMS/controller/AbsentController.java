package com.team3.CSMS.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.CSMS.dto.ClassInfoDto;
import com.team3.CSMS.dto.StudentListDto;
import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.service.ClassListService;
import com.team3.CSMS.service.ClassStudentListService;

@Controller
public class AbsentController {
    @Autowired
    private ClassListService clService;
    // @Autowired
    // private AbsentService absService;
    @Autowired
    private ClassStudentListService cslService;
    
    @GetMapping("/absentCheck")
    public String getAll(Model model){
        List<ClassList> clList= clService.findAll();
        if(clList != null){
            model.addAttribute("ClList",clList);
        }
        return "absent/absentCheck";
    }

    @GetMapping(value = "/clCodeList.json",
                produces = {"application/json;charset=UTF-8"})
    public @ResponseBody List<ClassList> getcode(){
        List<ClassList> clList = clService.findAll();
        return clList;
    }
    //取得 上課資訊 & 學生清單
    @GetMapping(value = "/clInfo.json",
                produces = {"application/json;charset=UTF-8"})
    public @ResponseBody Map<String,Object> getClassInfoByID(@RequestParam("classCodeId") Integer classCodeId){
        Map<String,Object> map = new HashMap<>();
        List<ClassInfoDto> cliDto=clService.getClassInfoByClassCodeId(classCodeId);
        List<StudentListDto>slDto=cslService.getStudentListByClassCodeId(classCodeId);
        map.put("slDto", slDto);
        map.put("cliDto", cliDto);
        return map;
    }
}
