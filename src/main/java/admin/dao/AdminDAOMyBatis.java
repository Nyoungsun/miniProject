package admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;
import member.bean.MemberDTO;

@Repository
@Transactional
public class AdminDAOMyBatis implements AdminDAO{
	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<BoardDTO> getBoardList(Map<String, Integer> map) {
		return sqlSession.selectList("adminSQL.getBoardList",map);
		
	}
	
	@Override
	public int getTotalA() {
		return sqlSession.selectOne("adminSQL.getTotalA");
	}
	@Override
	public List<MemberDTO> getMemberList(Map<String, Integer> map) {
		return sqlSession.selectList("adminSQL.getBoardList",map);
	}

	@Override
	public int getTotalB() {
		return sqlSession.selectOne("adminSQL.getTotalB");
	}

}
