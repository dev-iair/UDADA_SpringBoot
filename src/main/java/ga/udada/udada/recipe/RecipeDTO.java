package ga.udada.udada.recipe;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import ga.udada.udada.image.ImageDTO;
import ga.udada.udada.reply.ReplyDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecipeDTO {
	
	private Long rNo;
	private String mEmail;
	private String rTitle;
	private String rContent;
	private Date rDate;
	
	private List<RecipeIngredientDTO> ingredientList = new ArrayList<>();
	private ImageDTO imageDTO;
	
	private List<ReplyDTO> replyList;
	private int replyCnt;
	
	
	public static String dateFormatter(Date rDate) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd (E)");
		String formatedRDate = format.format(rDate);
		return formatedRDate;
	}

	
}
