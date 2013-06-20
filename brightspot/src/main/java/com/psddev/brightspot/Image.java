package com.psddev.brightspot;

import com.psddev.cms.db.Content;
import com.psddev.cms.db.Renderer;
import com.psddev.cms.db.ToolUi;
import com.psddev.dari.db.Recordable.PreviewField;
import com.psddev.dari.util.StorageItem;

@ToolUi.Referenceable
@Renderer.Engine("JSP")
@Renderer.Script("/WEB-INF/common/image.jsp")
@PreviewField("file")
public class Image extends Content {

	@Indexed
    @Required
	private String name;
	@Required
	private StorageItem file;
	private String caption;


	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}

	public String getCaption(){
		return caption;
	}
	
	public void setCaption(String caption){
		this.caption = caption;
	}

	public StorageItem getFile(){
		return file;
	}
	
	public void setFile(StorageItem file){
		this.file = file;
	}

    public String getUrl() {
	    if (file != null && file.getPublicUrl() != null) {
	        return file.getPublicUrl().toString();
	    } else {
	        return null;
	    }

	}

}