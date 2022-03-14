package com.jeong.board.service;

import java.util.List;

import com.jeong.board.domain.BoardDto;

public interface BoardService {

	public List<BoardDto> boardList();
	
	public BoardDto boardDetail(Long bno);
	
	public int boardInsert(BoardDto board);
	
	public void boardDelete(Long bno);
	
}
