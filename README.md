# django-todo
A simple todo app built with django

![todo App](https://raw.githubusercontent.com/shreys7/django-todo/develop/staticfiles/todoApp.png)
### Setup
To get this repository, run the following command inside your git enabled terminal
```bash
$ git clone https://github.com/shreys7/django-todo.git
```
You will need django to be installed in you computer to run this app. Head over to https://www.djangoproject.com/download/ for the download guide

Once you have downloaded django, go to the cloned repo directory and run the following command

```bash
$ python manage.py makemigrations
```

This will create all the migrations file (database migrations) required to run this App.

Now, to apply this migrations run the following command
```bash
$ python manage.py migrate
```

One last step and then our todo App will be live. We need to create an admin user to run this App. On the terminal, type the following command and provide username, password and email for the admin user
```bash
$ python manage.py createsuperuser
```

That was pretty simple, right? Now let's make the App live. We just need to start the server now and then we can start using our simple todo App. Start the server by following command

```bash
$ python manage.py runserver
```

Once the server is hosted, head over to http://127.0.0.1:8000/todos for the App.

Cheers and Happy Coding :

### Create Admin User
```bash
RUN echo "from django.contrib.auth.models import User; User.objects.create_superuser('<user_admin>', '<admin_email>', '<admin_pass>')" | python manage.py shell
```
### RUN K8S
If have this error "Error from server (NotFound): error when creating pod.yaml : namespaces my-django-app not found"
run this command
```bash
$ kubectl create namespace my-django-app
```
Run this command to start Kubernetes
```bash
$ kubectl apply -f run-k8s.yml
```
When you want stop this App
```bash
$ kubectl delete -f run-k8s.yml
```

### Run App in Server
Step 1 Update the instance packages
```bash
sudo apt update
```
Step 2 Install Docker
```bash
sudo apt -y install docker.io
```
Step 3 Install Minikube and conntrack
```bash
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x ./kubectl && sudo mv ./kubectl /usr/local/bin/kubectl
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
apt install conntrack
```
Step 4 add the current user to the docker group and start a new shell with the updated group membership.
```bash
sudo usermod -aG docker $USER && newgrp docker
```
Step 5 Start Minikube
```bash
minikube start --driver=docker
```
Step 6 Don't forgot login docker
```bash
Docker login
```
Step 7 run K8S <br />
Step 8 Forward port
```bash
kubectl port-forward svc/my-django-app-service 3000:80 --address 0.0.0.0 &
```