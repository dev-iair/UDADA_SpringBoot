package ga.udada.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import ga.udada.udada.member.MemberDTO;
import ga.udada.udada.member.MemberSpecDTO;

public interface MemberMapper {
	
	void join(MemberDTO memberDTO);
	
	int duplecateEmail(String mEmail);
	
	void joinStep2(MemberSpecDTO memberSpecDTO);
	
	MemberDTO myProfile(String mEmail);
	
	//int pwdCheck(MemberDTO memberDTO);
	
	MemberDTO pwdCheck(String mEmail);
	
	void leave(MemberDTO memberDTO);

	void updateMyProfile(MemberDTO memberDTO);
	
	List<MemberSpecDTO> selectMyWeight(String mEmail);
	
	MemberSpecDTO currentMyWeight(String mEmail);
	
	void insertWeight(MemberSpecDTO memberSpecDTO);
	
	void deleteWeight(int msNo);
	
	List<MemberSpecDTO> getMyWeightAndPaging(@Param("pageNum")int pageNum, @Param("pageSize")int pageSize, @Param("mEmail")String mEmail);
	
	int countAll(@Param("pageNum")int pageNum, @Param("pageSize")int pageSize, @Param("mEmail")String mEmail);
	
	MemberDTO findMEmail(String mEmail);
	
	void updatePwd(MemberDTO memberDTO);
	
	void updateMyProfileWithoutPwd(MemberDTO memberDTO);
}
