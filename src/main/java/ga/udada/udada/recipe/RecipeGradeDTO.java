package ga.udada.udada.recipe;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RecipeGradeDTO {
/*
	RG_NO	NUMBER
	R_NO	NUMBER
	M_EMAIL	VARCHAR2(100 BYTE)
	RG_GRADE	NUMBER*/
	
	private Long rgNo;
	private Long rNo;
	private String mEmail;
	private int rgGrade;
}
