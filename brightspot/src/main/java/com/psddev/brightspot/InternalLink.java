package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;

@ToolUi.LabelFields("pageContent")
public class InternalLink extends Link{

    @DisplayName("Content")
    @ToolUi.OnlyPathed
    private Content pageContent;

    
	public Content getPageContent() {
		return pageContent;
	}

	public void setPageContent(Content pageContent) {
		this.pageContent = pageContent;
	}
	
    public String getUrl() {
        return (pageContent != null ? pageContent.getPermalink() : null);
    }
}
