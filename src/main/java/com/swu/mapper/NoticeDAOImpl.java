package com.swu.mapper;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.swu.vo.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO{
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.swu.mapper.NoticeDAO";

	@Override
	public List<NoticeVO> nlist() throws Exception {
		
		return sql.selectList(namespace + ".nlist");
	}

	@Override
	public void nwrite(NoticeVO vo) throws Exception {
		
		sql.insert(namespace + ".nwrite", vo);
		
	}

	@Override
	public NoticeVO nview(int n_num) throws Exception {
		
		return sql.selectOne(namespace + ".nview", n_num);
	}

	@Override
	public void nmodify(NoticeVO vo) throws Exception {
		
		sql.update(namespace + ".nmodify", vo);
	}

	@Override
	public void ndelete(int n_num) throws Exception {
		sql.delete(namespace + ".delete", n_num);
		
	}

}
