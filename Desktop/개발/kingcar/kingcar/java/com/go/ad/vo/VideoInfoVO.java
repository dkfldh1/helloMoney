package com.go.ad.vo;

public class VideoInfoVO {
	private int id;
	private String title;
	private String videoId;
	private String thumbnail;
	private String channelTitle;
	private int viewCount;
	private String category;
	private String viewFlag;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getChannelTitle() {
		return channelTitle;
	}
	public void setChannelTitle(String channelTitle) {
		this.channelTitle = channelTitle;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getViewFlag() {
		return viewFlag;
	}
	public void setViewFlag(String viewFlag) {
		this.viewFlag = viewFlag;
	}
	
	@Override
	public String toString() {
		return "CategotyInfoVO [id=" + id + ", title=" + title + ", videoId=" + videoId + ", thumbnail=" + thumbnail
				+ ", channelTitle=" + channelTitle + ", viewCount=" + viewCount + ", category=" + category
				+ ", viewFlag=" + viewFlag + "]";
	}
}
