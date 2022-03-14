package com.jeong.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeong.board.domain.BoardDto;
import com.jeong.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping(value = "/board/list.do")
	public String boardList(Model model) {
		
		List<BoardDto> boardList = boardService.boardList();
		
		model.addAttribute("list", boardList);
		
		return "boardList";
	}
	
	@GetMapping(value = "/board/boardDetail.do")
	public String boardDetail(@RequestParam("bno") Long bno, Model model) {
		
		model.addAttribute("view", boardService.boardDetail(bno));
		
		return "boardDetail";
	}
	
	@RequestMapping(value = "/board/insertForm")
	public String insertForm() {
		return "boardInsert";
	}
	
	@RequestMapping(value = "/board/boardInsert.do")
	@ResponseBody
	public int boardInsert(@RequestBody BoardDto board) {
		
		return boardService.boardInsert(board);
		
	}
	
	@RequestMapping(value = "/board/updateForm")
	public String updateForm(@RequestParam("bno") Long bno, Model model) {
		
		model.addAttribute("board", boardService.boardDetail(bno));
		
		return "boardUpdate";
	}
	
	@RequestMapping(value = "/board/boardUpdate.do")
	@ResponseBody
	public int boardUpdate(@RequestBody BoardDto board) {
		return boardService.boardInsert(board);
	}
	
	@RequestMapping(value = "/board/boardDelete.do")
	public String boardDelete(@RequestParam("bno") Long bno) {
		
		boardService.boardDelete(bno);
		
		return "redirect:/board/list.do";
	}

}
