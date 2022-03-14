package com.jeong.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jeong.board.domain.BoardDto;

@Mapper
public interface BoardMapper {

	public List<BoardDto> boardList();
	
	public BoardDto boardDetail(Long bno);
	
	public int insertBoard(BoardDto board);
	
	public int updateBoard(BoardDto board);
	
	public int deleteBoard(Long bno);
	
}
