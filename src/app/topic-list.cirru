
var
  React $ require :react
  Immutable $ require :immutable

var controller $ require :../controller

var
  Space $ React.createFactory $ require :./space
  Button $ React.createFactory $ require :./button
  TopicEntry $ React.createFactory $ require :./topic-entry
  MessageList $ React.createFactory $ require :./message-list

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :topic-list

  :propTypes $ {}
    :topics $ . (React.PropTypes.instanceOf Immutable.List) :isRequired
    :messages $ . (React.PropTypes.instanceOf Immutable.List) :isRequired
    :isTopicEnd React.PropTypes.bool.isRequired
    :selectedTopic React.PropTypes.string

  :onMore $ \ ()
    controller.topicMore

  :renderTopic $ \ (topic)
    TopicEntry $ {} (:topic topic) (:key $ topic.get :id) (:showLabel true)
      :isSelected (is (topic.get :id) @props.selectedTopic)

  :render $ \ ()
    div ({} :style @styleRoot)
      Space $ {} (:height 40)
      MessageList $ {} (:messages @props.messages)
      @props.topics.map @renderTopic
      cond (not @props.isTopicEnd)
        div ({} (:style $ @styleFooter))
          Button $ {} (:text :more) (:onClick @onMore)
      Space $ {} (:height 400)

  :styleRoot $ {}
    :width :800px
    :flex 1
    :overflowY :auto
    :display :inline-block

  :styleFooter $ \ ()
    {}
      :display :flex
      :justifyContent :flex-start
      :marginTop :10px
      :paddingLeft :40px
