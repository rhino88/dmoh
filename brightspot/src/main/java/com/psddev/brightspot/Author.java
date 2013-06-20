package com.psddev.brightspot;

import com.psddev.cms.db.Content;
import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.ToolUi;
import com.psddev.dari.db.Recordable.PreviewField;

@ToolUi.GlobalFilter
public class Author extends Content {

	@Required
	@Indexed
	private String name;
	private Image profileImage;
	private ReferentialText bio;


	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}

	public Image getProfileImage(){
		return profileImage;
	}
	
	public void setProfileImage(Image profileImage){
		this.profileImage = profileImage;
	}	

	public ReferentialText getBio(){
		return bio;
	}
	
	public void setBio(ReferentialText bio){
		this.bio = bio;
	}


}