package com.swu.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.swu.service.BoardService;
import com.swu.vo.BoardVO;
import com.swu.vo.Criteria;
import com.swu.vo.PageMakerDTO;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
    private BoardService bservice;
	
	/* 게시판 목록 페이지 접속 */
//	@RequestMapping(value="/list", method=RequestMethod.GET)
//    public void boardListGET(Model model) {
//        log.info("게시판 목록 페이지 진입");
//       model.addAttribute("list", bservice.getList());
//    }
	
	/* 게시판 목록 페이지 접속(페이징 적용) */
	@RequestMapping(value="/list", method=RequestMethod.GET)
    public void boardListGET(Model model, Criteria cri) {
        log.info("boardListGET");
        model.addAttribute("list", bservice.getListPaging(cri));
        int total = bservice.getTotal(cri);
        PageMakerDTO pageMake = new PageMakerDTO(cri, total);
        model.addAttribute("pageMaker", pageMake);
    }
   
    @RequestMapping(value="/enroll", method=RequestMethod.GET)
    public void boardEnrollGET() {
        log.info("게시판 등록 페이지 진입");
    }
	
    /* 게시판 등록 */
    @RequestMapping(value="/enroll", method=RequestMethod.POST)
    public String boardEnrollPOST(BoardVO board, RedirectAttributes rttr) {
        log.info("BoardVO : " + board);
        bservice.enroll(board);
        rttr.addFlashAttribute("result", "enroll success");
        return "redirect:/board/list";
    }
    
    /* 게시물 상세화면 */
    @RequestMapping(value="/get", method=RequestMethod.GET)
    public void boardGetPageGET(int bno, Model model, Criteria cri, BoardVO board) {
        model.addAttribute("pageInfo", bservice.getPage(bno));
        model.addAttribute("cri", cri);
        System.out.println(board.getViewnum());
    }
    
    /* 수정 페이지로 이동 */
    @RequestMapping(value="/modify", method=RequestMethod.GET)
    public void boardModifyGET(int bno, Model model) {
        model.addAttribute("pageInfo", bservice.getPage(bno));
    }
    
    /* 게시물 수정하기 */  
    @RequestMapping(value="/modify", method=RequestMethod.POST)
    public String boardModifyPOST(BoardVO board, RedirectAttributes rttr) {
        bservice.modify(board);
        rttr.addFlashAttribute("result", "modify success");
        return "redirect:/board/list";
    }  
    
    /* 페이지 삭제 */
    @RequestMapping(value="/delete", method=RequestMethod.POST)
    public String boardDeletePOST(int bno, RedirectAttributes rttr) {
        bservice.delete(bno);
        rttr.addFlashAttribute("result", "delete success");
        return "redirect:/board/list";
    }
    
 
}
