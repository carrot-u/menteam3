import React from "react"
import PropTypes from "prop-types"


class Comment extends React.Component {
  constructor(props) {
    super(props);
    const shorten_list = this.props.comments.slice((this.props.comments.length - 3), this.props.comments.length);
    const initial_list = (this.props.comments.length > 3) ? shorten_list : this.props.comments;
    const view_more_message_count = this.props.comments.length - 3;
    this.state = {
      comments_list: initial_list,
      view_more_message: "View " + view_more_message_count + " more comments",
    }
  }
  showMore = () => {
    const shorten_list = this.props.comments.slice((this.props.comments.length - 3), this.props.comments.length);
    const initial_list = (this.props.comments.length > 3) ? shorten_list : this.props.comments;
    const view_more_message_count = this.props.comments.length - 3;
    let current_message = document.getElementById('show_more_comments')
    let show_less_message = 'Show less comments'
    if (current_message.innerHTML == show_less_message) {
      this.setState({
        comments_list: initial_list,
        view_more_message: "View " + view_more_message_count + " more comments" })
    } else {
      this.setState({
        comments_list: this.props.comments,
        view_more_message: show_less_message,
      });
    };
  };
  render () {
    console.log(this.state.comments_list)
    let single_comment = this.state.comments_list.map ((e) => {
      let parse_comment = JSON.parse(e)
      return [
        <div id='comment'>
          <h6 id='comment_author'>{parse_comment.user.first_name} says:</h6>
          <p>{parse_comment.comment}</p>
        </div>
      ]
    });
    let message = this.props.comments.length > 3 ? this.state.view_more_message : null;
    ;
    return (
    <div>
      <h6 id='show_more_comments'onClick={this.showMore}>{message}</h6>
      {single_comment}
    </div>)
  }
}

Comment.propTypes = {
  comments: PropTypes.array
};
export default Comment
