class Post{
  String id,title,content,featured_image,data_written;
  int votesUp,votesDown,userID,categoryID;
  List<int>votersup,votersdown;

  Post({this.id, this.title, this.content, this.featured_image,
      this.data_written, this.userID, this.categoryID, this.votesUp,
      this.votesDown, this.votersup, this.votersdown});

}