class UserBehavior(TaskSet):

    @task
    def get_users(self):
        self.client.get("/emp")
        
    @task
    def put_user(self):
        self.client.post("/tests", {
		 "user": "ironman",
                 "email": "ironman@xyz.com"
	})
        

class WebsiteUser(HttpLocust):
    task_set = UserBehavior