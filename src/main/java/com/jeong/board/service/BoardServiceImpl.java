package com.jeong.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeong.board.domain.BoardDto;
import com.jeong.board.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private final BoardMapper boardMapper;
	
	public BoardServiceImpl(BoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	}
	
	@Override
	public List<BoardDto> boardList() {
		List<BoardDto> boardList = boardMapper.boardList();
		
		return boardList;
	}
	
	@Override
	public BoardDto boardDetail(Long bno) {
		return boardMapper.boardDetail(bno);
	}
	
	@Override
	public int boardInsert(BoardDto board) {
		int result = 0;
		
		if(board.getBno() == null) {
			result = boardMapper.insertBoard(board);
		} else {
			result = boardMapper.updateBoard(board);
		}
		
		return result;
	}
	
	@Override
	public void boardDelete(Long bno) {
		
		boardMapper.deleteBoard(bno);
		
	}
}
