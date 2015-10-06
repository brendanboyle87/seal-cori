var QuestionOne = React.createClass({
  handleSubmit: function(e) {
    e.preventDefault();

    var text = "test"
  },
  render: function() {
    return (
    <form className="questionOne" onSumbit={this.handleSubmit}>
        <input type="radio" name="yes_or_no" value="yes" />Yes

        <input type="radio" name="yes_or_no" value="no" />No

        <input type="submit" />
    </form>
    );
  }
});
