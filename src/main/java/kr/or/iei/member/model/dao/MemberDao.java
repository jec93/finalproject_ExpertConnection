package kr.or.iei.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.iei.member.model.vo.Member;

@Repository("dao")
public class MemberDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	public Member memberLogin(Member member) {
		return sqlSession.selectOne("member.selectOneMember", member);
	}

	public int join(Member member) {
		return sqlSession.insert("member.insertMember", member);
	}
	
	public int idDuplChk(String memberId) {		
		return sqlSession.selectOne("member.idDuplChk", memberId);
	}
}
