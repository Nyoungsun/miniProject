package member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Service
public class MemberServiceImple implements MemberService{
	
	@Autowired
	public MemberDAO memberDAO;

	@Override
	public MemberDTO getMember(Map<String, String> map) {
		MemberDTO memberDTO = memberDAO.getMember(map);
		
		return memberDTO;
	}

	@Override
	public int update(MemberDTO memberDTO) {
		int count = memberDAO.update(memberDTO);
		
		return count;
	}

	@Override
	public String checkPwd(String id) {
		String pwd = memberDAO.checkPwd(id);
		
		return pwd;
	}

	@Override
	public String getBoards(String id) {
		String boards = memberDAO.getBoards(id);
		
		return boards;
	}
	

	@Override
	public List<BoardDTO> getMyMission(List<String> boardSeq) {
		List<BoardDTO> boardList = memberDAO.getMyMission(boardSeq);
		
		return boardList;
	}

}
