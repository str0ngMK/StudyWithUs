package com.swu.mapper;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.swu.vo.LoginReqVo;
import com.swu.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;

	/*@Override
	public List selectAllMemberList() throws DataAccessException {
		List<MemberVO> membersList = null;
		membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return membersList;
	}*/

	@Override
	public void register(MemberVO memberVO) throws DataAccessException {
		sqlSession.insert("mapper.member.register", memberVO);
	}

	/*@Override
	public int deleteMember(String id) throws DataAccessException {
		int result = sqlSession.delete("mapper.member.deleteMember", id);
		return result;
	}*/

	@Override
	public MemberVO login(LoginReqVo reqVo) throws DataAccessException {
		MemberVO vo = sqlSession.selectOne("mapper.member.login", reqVo);
		return vo;
	}

	@Override
	public void memberUpdate(MemberVO memberVO) throws Exception {
		sqlSession.update("mapper.member.memberUpdate", memberVO);
	}

	@Override
	public void memberDelete(MemberVO memberVO) throws Exception {
		sqlSession.delete("mapper.member.memberDelete", memberVO);
	}

	@Override
	public int idChk(MemberVO memberVO) throws Exception {
		int result = sqlSession.selectOne("mapper.member.idChk", memberVO);
		return result;
	}

	@Override
	public List<MemberVO> memberList() throws Exception {
		return sqlSession.selectList("mapper.member.memberList");
	}

}
