package com.swu.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.swu.service.NoticeService;
import com.swu.vo.NoticeVO;
import com.swu.vo.Page;

@Controller
public class NoticeController {
	
	@Inject
	private NoticeService service;
	
	// 공지사항 목록 + 페이징 추가
//	@RequestMapping(value = "notice/noticepage", method = RequestMethod.GET)
//	public void getListPage(Model model) throws Exception {
//		 
//		List<NoticeVO> nlist = null;
//		nlist = service.nlist();
//		model.addAttribute("nlist", nlist);
//		
//	}
	
	// 공지사항 작성 화면
	@RequestMapping(value = "notice/noticewrite", method = RequestMethod.GET)
	public void noticeGetWrite(Locale locale, Model model) {
	
	}
	
	// 공지사항 작성(insert 처리)
	@RequestMapping(value = "notice/noticewrite", method = RequestMethod.POST)
	public String noticePostWrite(NoticeVO vo) throws Exception {

		service.nwrite(vo);
		
		return "redirect:/notice/noticelistpage?num=1";
	}
	
	// 공지사항 상세보기
	@RequestMapping(value = "notice/noticeview", method = RequestMethod.GET)
	public void noticeView(@RequestParam("n_num") int n_num, Model model) throws Exception {
		
		NoticeVO vo = service.nview(n_num);
		
		model.addAttribute("nview", vo);
	}
	
	// 공지사항 수정1
	@RequestMapping(value = "notice/noticemodify", method = RequestMethod.GET)
	public void noitceGetModify(@RequestParam("n_num") int n_num, Model model) throws Exception {
		
		NoticeVO vo = service.nview(n_num);
		
		model.addAttribute("nview", vo);
		
	}
	
	// 공지사항 수정2
		@RequestMapping(value = "notice/noticemodify", method = RequestMethod.POST)
		public String noitcePostModify(NoticeVO vo) throws Exception {
			
			service.nmodify(vo);
			
			return "redirect:noticeview?n_num=" + vo.getN_num();
	}
		
	// 공지사항 삭제
	@RequestMapping(value = "notice/delete", method = RequestMethod.GET)
	public String noitcegetDelete(@RequestParam("n_num") int n_num) throws Exception {
		
		service.ndelete(n_num);
		
		return "redirect:/notice/noticelistpage?num=1";
	}
	
	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "notice/noticelistpage", method = RequestMethod.GET)
	public void getnoitceListPage(Model model, @RequestParam("num") int num) throws Exception {
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.count());

		List<NoticeVO> nlist = null; 
		nlist = service.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("nlist", nlist);
//		model.addAttribute("pageNum", page.getPageNum());

//		model.addAttribute("startPageNum", page.getStartPageNum());
//		model.addAttribute("endPageNum", page.getEndPageNum());
		 
//		model.addAttribute("prev", page.isPrev());
//		model.addAttribute("next", page.isNext());  

		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
//		// 게시물 총 갯수
//		 int count = service.count();
//		  
//		 // 한 페이지에 출력할 게시물 갯수
//		 int postNum = 10;
//		  
//		 // 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
//		 int pageNum = (int)Math.ceil((double)count/postNum);
//		  
//		 // 출력할 게시물
//		 int displayPost = (num - 1) * postNum;
//		 
//		// 한번에 표시할 페이징 번호의 갯수
//		 int pageNum_cnt = 10;
//
//		 // 표시되는 페이지 번호 중 마지막 번호
//		 int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);
//
//		 // 표시되는 페이지 번호 중 첫번째 번호
//		 int startPageNum = endPageNum - (pageNum_cnt - 1);
//		 
//		// 마지막 번호 재계산
//		 int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
//		  
//		 if(endPageNum > endPageNum_tmp) {
//		  endPageNum = endPageNum_tmp;
//		 }
//		 
//		 boolean prev = startPageNum == 1 ? false : true;
//		 boolean next = endPageNum * pageNum_cnt >= count ? false : true;
//		    
//		 List<NoticeVO> nlist = null;
//		 
//		 nlist = service.listPage(displayPost, postNum);
//		 model.addAttribute("nlist", nlist);   
//		 model.addAttribute("pageNum", pageNum);
//		 
//		// 시작 및 끝 번호
//		 model.addAttribute("startPageNum", startPageNum);
//		 model.addAttribute("endPageNum", endPageNum);
//
//		 // 이전 및 다음 
//		 model.addAttribute("prev", prev);
//		 model.addAttribute("next", next);
//		 
//		 // 현재 페이지
//		 model.addAttribute("select", num);
		
	}
	
	// 게시물 목록 + 페이징 추가 + 검색
	@RequestMapping(value = "notice/noticepagesearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num, 
			@RequestParam(value = "searchType",required = false, defaultValue = "n_title") String searchType,
			@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
	  ) throws Exception {

	 
	 Page page = new Page();
	 
	 page.setNum(num);
	 //page.setCount(service.count());
	 page.setCount(service.searchCount(searchType, keyword));
	 
	 // 검색 타입과 검색어
	 //page.setSearchTypeKeyword(searchType, keyword);
	 page.setSearchType(searchType);
	 page.setKeyword(keyword);
	 
	 List<NoticeVO> nlist = null;
	 //list = service.listPage(page.getDisplayPost(), page.getPostNum());
	 nlist = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
	 
	 model.addAttribute("nlist", nlist);
	 model.addAttribute("page", page);
	 model.addAttribute("select", num);
	 
	 // model.addAttribute("searchType", searchType);
	 // model.addAttribute("keyword", keyword);
	 
	}
		
}
