package com.team3.CSMS.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.CSMS.dto.AbsentListDto;
import com.team3.CSMS.dto.ClassInfoDto;
import com.team3.CSMS.dto.StudentListDto;
import com.team3.CSMS.model.Absent;
import com.team3.CSMS.model.ClassList;
// import com.team3.CSMS.model.Student;
import com.team3.CSMS.service.AbsentService;
import com.team3.CSMS.service.ClassListService;
import com.team3.CSMS.service.ClassStudentListService;
// import com.team3.CSMS.service.StudentService;

@Controller
public class AbsentController {
    @Autowired
    private ClassListService clService;
    @Autowired
    private AbsentService absService;
    @Autowired
    private ClassStudentListService cslService;
    // @Autowired
    // private StudentService stuService;
    
    // @GetMapping("/absentCheck")
    // public String getAll(Model model){
    //     List<ClassList> clList= clService.findAll();
    //     if(clList != null){
    //         model.addAttribute("ClList",clList);
    //     }
    //     return "absent/absentCheck";
    // }
    
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
    //透過ID和日期 查出缺勤表
    @GetMapping(value = "/getAbsentData.json",
                produces = {"application/json;charset=UTF-8"})
    public @ResponseBody  Map<String,Object> getAbsentByIdAndDay(@RequestParam("classCodeId")Integer classCodeId,@RequestParam("days")String days){
        System.out.println(classCodeId);
        System.out.println(days);
        Map<String,Object> map = new HashMap<>();
        List<ClassInfoDto> cliDto=clService.getClassInfoByClassCodeId(classCodeId);
        List<Absent> abList=absService.searchAbsent(classCodeId, days);
        // List<AbsentDataDto> abList=absService.searchAbsent(classCodeId, days);
        map.put("cliDto", cliDto);
        map.put("abList", abList);
        return map;
    }
    
    
    //透過Id和日期及學生姓名來查出缺勤表-Neil
    @GetMapping(value = "/getAbsentDataAjax.controller",
            produces = {"application/json;charset=UTF-8"})
    public @ResponseBody Map<String,Object> getAbsentDataAjax
    (@RequestParam("classCodeId")Integer classCodeId,@RequestParam("days")String days,@RequestParam(name="studentName")String studentName){
    System.out.println(classCodeId);
    System.out.println(days);
    System.out.println(studentName);
    Map<String,Object> map = new HashMap<>();
    List<ClassInfoDto> cliDto=clService.getClassInfoByClassCodeId(classCodeId);
    List<Absent> abList = absService.findStuMohu(classCodeId, days, "%"+studentName+"%");
//    List<Absent> abList=absService.searchAbsent(classCodeId, days);
    // List<AbsentDataDto> abList=absService.searchAbsent(classCodeId, days);
    map.put("cliDto", cliDto);
    map.put("abList", abList);
    return map;
}
    
    
    // 透過ID更改學生出缺情狀況
    //FIXME:跳轉
    @GetMapping(value="/updateStudentOrNotByID")
    public @ResponseBody void updateStudentAbsentById (@RequestParam(name="absid")Integer absid,@RequestParam(name="absOrNot") Integer absOrNot){
        Absent oneAbsent=absService.findStudentAbsentById(absid);
        oneAbsent.setArrviedOrNot(absOrNot);
        absService.insertAbsent(oneAbsent);
        // return "redirect:/absentUpdate.page";
    }  
    
    // 批量新增absentData 
    //FIXME:跳轉
    @PostMapping("/absentDataInsert")
    public String insertAbsent(@RequestBody List<AbsentListDto> AbsentListJsonString){
        // for迴圈把json資料單獨讀出 放進自己寫的AbsentListDto裡
        for(AbsentListDto oneAbsentDto:AbsentListJsonString){
            Integer classId =oneAbsentDto.getClassCodeId();
            Integer studentId =oneAbsentDto.getStudentId();
            Integer arrivedValue =oneAbsentDto.getArrivedValue();
            // System.out.println("classId: "+classId);
            // System.out.println("studentId: "+ studentId);
            // System.out.println("arrivedValue: "+arrivedValue);
            // 方法一
            // Absent oAbsent=new Absent();
            // // 透過id get classList  把classList塞進去
            // ClassList cl=clService.findById(classId);
            // oAbsent.setClassList(cl);
            // // 透過id Get student 把student塞進去
            // Student student=stuService.findStudentById(studentId);
            // oAbsent.setStudent(student);
            // oAbsent.setArrviedOrNot(arrivedValue);
            // absService.insert(oAbsent);
            // System.out.println("start insert");
            //方法二 透過原生語法 把變數個別塞入
            absService.insertAbsentData(classId, studentId, arrivedValue);
            // System.out.println("end of insert");
        }
        return "gogogo";
    }

}
