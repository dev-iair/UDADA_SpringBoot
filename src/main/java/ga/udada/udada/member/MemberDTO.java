package ga.udada.udada.member;


import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO implements Serializable{
	
	
	private String mEmail;	
	private String mName;
	private String mPw;
	private Date mBirth;
	private String mGender;
	private String mGrade;
	private String mMeal;
	private String mGoaltype;

}
