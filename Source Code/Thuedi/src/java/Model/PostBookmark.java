/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Admin
 */
public class PostBookmark {
    private Post post;
    private Bookmark bookmark;

    public PostBookmark() {
    }

    public PostBookmark(Post post, Bookmark bookmark) {
        this.post = post;
        this.bookmark = bookmark;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public Bookmark getBookmark() {
        return bookmark;
    }

    public void setBookmark(Bookmark bookmark) {
        this.bookmark = bookmark;
    }
}
