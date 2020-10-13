module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def add_friend_btn user
    if !current_user.friend?(user) && current_user != user
      link = capture { link_to 'Add as a Friend', friendships_path(controller: 'friendships', action: 'create', friendship: {user_id: current_user, friend_id: user, confirmed: false}), method: :post, class: ' btn btn-success mr-2'}
      if current_user.request_exists?(user)
        link = capture { link_to 'Request Sent', users_path , class: 'disabled btn btn-success mr-2'}
        link << capture { link_to 'Cancle Request', friendship_path(controller: 'friendships', action: 'delete', id: find_friendship(current_user.id, user.id) ), method: :delete, class:' btn btn-warning' }
      else
        link
      end
    end
  end
end
