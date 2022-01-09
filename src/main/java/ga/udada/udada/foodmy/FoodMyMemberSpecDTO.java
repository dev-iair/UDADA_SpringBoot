package ga.udada.udada.foodmy;

import ga.udada.udada.member.MemberDTO;
import ga.udada.udada.member.MemberSpecDTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FoodMyMemberSpecDTO {
	
	private MemberDTO memberDTO;
	private MemberSpecDTO memberSpecDTO;


}
