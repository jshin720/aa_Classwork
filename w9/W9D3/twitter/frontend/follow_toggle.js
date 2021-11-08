class FollowToggle {
    
    constructor(el) {
        
        this.$el = $(el)
        console.log(this.$el)
        this.followState = this.$el.data("initial-follow-state");
        this.userID = this.$el.data("user-id");
        this.render();
        // console.log(this.$el[0])
    }

    render() {
        
        if (this.followState === 'unfollowed') {
            console.log('16')
            this.$el.text('Follow');
        } else {
            console.log('19hello')
            this.$el.text("Unfollow");
        }
    }
}


module.exports = FollowToggle;