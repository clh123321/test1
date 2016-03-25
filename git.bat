-- #1 安装完之后，设置
$ git config --global user.name "Your Name"
$ git config --global user.email "444261689@qq.com"

-- #2 创建版本库
$ mkdir learngit 						--创建文件夹
$ cd learngit							--进入文件夹
$ pwd									--命令用于显示当前目录
$ git init 								--创建空仓库 目录下多
了一个.git

-- #3 把文件添加到版本库
$ git add readme.txt  					--文件添加到仓库 文件被放入暂存区
$ git commit -m "wrote a readme file"	--文件提交到仓库 -m后面输入的是本次提交的说明


$ git status							--仓库当前的状态
$ git diff readme.txt 					--对比
$ git diff HEAD -- readme.txt 			--命令可以查看工作区和版本库里面最新版本的区别
$ git add readme.txt					--提交修改和提交新文件是一样的两步

-- #4 版本退回
$ git log								--显示从最近到最远的提交日志
$ git log --pretty=oneline				--显示最近一次的提交日志
$ git reset --hard HEAD^				--HEAD指向哪个版本号

$ cat readme.txt						--退到上一个版本
$ git reset --hard 3628164				--版本号没必要写全，前几位就可以了

$ git reflog							--查看命令历史，以便确定要回到未来的哪个版本

$ git checkout -- readme.txt			--把readme.txt文件在工作区的修改全部撤销 
										--让这个文件回到最近一次git commit或git add时的状态

$ git reset HEAD readme.txt   			--既可以回退版本，也可以把暂存区的修改回退到工作区

$ rm test.txt 							--删除了没用文件
$ git rm test.txt  						--命令git rm删掉，并且git commit

-- #5 远程仓库
$ ssh-keygen -t rsa -C "444261689@qq.com"	--1,创建SSH Key
											--2,登陆GitHub，打开“Account settings”，“SSH Keys”页面
											--3,点“Add SSH Key”，填上任意Title，在Key文本框里粘贴id_rsa.pub文件的内容

-- #6 添加远程库
$ git remote add origin git@github.com:clh123321/test1.git  	

$ git push -u origin master				--当前分支master推送到远程
$ git push origin master   				--把本地master分支的最新修改推送至GitHub

-- #7 克隆
$ git clone git@github.com:michaelliao/gitskills.git  	--git clone克隆一个本地库
														--GitHub给出的地址不止一个，还可以用
														--https://github.com/michaelliao/gitskills.git
$ cd gitskills
$ ls									--查看本地文件

-- #8 分支管理
$ git checkout -b dev					--创建dev分支，然后切换到dev分支
$ git branch dev						--查看当前分支
$ git checkout dev						--切换到当前分支

$ git branch							--列出所有分支
$ git checkout master					--切换到当前分支

$ git merge dev							--把dev分支的工作成果合并到master分支上
$ git branch -d dev						--删除dev分支

$ git log --graph --pretty=oneline --abbrev-commit	--用带参数的git log也可以看到分支的合并情况

-- #9 分支管理策略
$ git checkout -b dev
$ git add readme.txt 
$ git commit -m "add merge"
$ git checkout master
$ git merge --no-ff -m "merge with no-ff" dev	--准备合并dev分支，请注意--no-ff参数，表示禁用Fast forward
$ git log --graph --pretty=oneline --abbrev-commit 

-- #10 Bug分支
$ git stash
$ git stash list
$ git stash pop
$ git stash apply stash@{0}

-- #11 Feature分支
$ git checkout -b feature-vulcan
$ git add vulcan.py
$ git status
$ git commit -m "add feature vulcan"
$ git checkout dev
$ git branch -d feature-vulcan
$ git branch -D feature-vulcan

-- #12 多人协作
$ git remote
$ git remote -v 				--显示更详细的信息

$ git push origin master
$ git push origin dev
$ git clone git@github.com:michaelliao/learngit.git

$ git checkout -b dev origin/dev
$ git commit -m "add /usr/bin/env"
$ git push origin dev

-- #13 创建标签
$ git tag v1.0					--打一个新标签
$ git tag	
$ git log --pretty=oneline --abbrev-commit	
$ git tag v0.9 6224937
$ git show v0.9				

$ git tag -a v0.1 -m "version 0.1 released" 3628164

$ git tag -d v0.1 				--删除

$ git push origin v1.0
$ git push origin --tags
$ git push origin :refs/tags/v0.9


$ git config --global color.ui true

