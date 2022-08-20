package com.swu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.swu.mapper.MemberDAO;
import com.swu.vo.LoginReqVo;
import com.swu.vo.MemberVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	/*@Override
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = memberDAO.selectAllMemberList();
		return membersList;
	}*/

	/*@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}*/

	/*@Override
	public int removeMember(String id) throws DataAccessException {
		return memberDAO.deleteMember(id);
	}*/

	@Override
	public MemberVO login(LoginReqVo reqVo) throws Exception {
		return memberDAO.login(reqVo);
	}

	@Override
	public void register(MemberVO memberVO) throws DataAccessException {
		memberDAO.register(memberVO);
	}



}
