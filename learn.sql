/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50527
 Source Host           : localhost:3306
 Source Schema         : learn

 Target Server Type    : MySQL
 Target Server Version : 50527
 File Encoding         : 65001

 Date: 25/09/2020 20:07:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '管理员', 'admin', 'admin');

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES (1, '信息科学与工程学院', '信息科学与工程学院');
INSERT INTO `college` VALUES (2, '人工智能学院', '人工智能学院');
INSERT INTO `college` VALUES (3, '外国语学院', '外国语学院');
INSERT INTO `college` VALUES (9, '化工学院', '化工学院');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `college_id` int(11) NOT NULL DEFAULT 0,
  `num` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 'Java Web 程序设计', 1, '80015001', '介绍MVC设计思想，包括JSP+Servet+Java Bean，以及Spring MVC+MyBatis的框架整合开发。');
INSERT INTO `course` VALUES (2, 'vue技术', 1, '80015002', '掌握微软SQLServer 2016数据库的使用以及触发器等开发。');
INSERT INTO `course` VALUES (3, '英语高级写作技巧', 3, '70010002', '基于英语写作基础，进阶教授英语写作高级技巧，锻炼学生写作能力。');

-- ----------------------------
-- Table structure for course_file
-- ----------------------------
DROP TABLE IF EXISTS `course_file`;
CREATE TABLE `course_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0',
  `course_id` int(11) NULL DEFAULT 0,
  `record_time` datetime NULL DEFAULT NULL,
  `teacher_id` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course_file
-- ----------------------------
INSERT INTO `course_file` VALUES (1, '大学第一课', 1, '2020-09-10 18:51:24', 1);

-- ----------------------------
-- Table structure for course_video
-- ----------------------------
DROP TABLE IF EXISTS `course_video`;
CREATE TABLE `course_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `course_id` int(11) NOT NULL DEFAULT 0,
  `record_time` datetime NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for discuss
-- ----------------------------
DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `record_time` datetime NULL DEFAULT NULL,
  `course_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of discuss
-- ----------------------------
INSERT INTO `discuss` VALUES (1, '在大学英语六级考试中，看图写作文的语言组织思路是什么？', '大学六级考试作文部分越来越重视看图写作文技巧的考察，从读懂图中所说含义到架构构思，再到具体撰写，应该遵循怎样的思路？', 1, '2020-09-03 14:52:37', 3);
INSERT INTO `discuss` VALUES (5, '疑问解答', '大家对此次课程的疑问可以在下面提出，我会尽快给大家回复', 1, '2020-09-24 20:15:35', 1);

-- ----------------------------
-- Table structure for discuss_post
-- ----------------------------
DROP TABLE IF EXISTS `discuss_post`;
CREATE TABLE `discuss_post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `discuss_id` int(11) NOT NULL DEFAULT 0,
  `student_id` int(11) NOT NULL DEFAULT 0,
  `record_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of discuss_post
-- ----------------------------
INSERT INTO `discuss_post` VALUES (1, '看图写作文应当从图中人物或事物关系开始，理解图中所描述的事是关于生活、工作、旅行、哲学等等，搞清楚这些才是理解图文的重要步骤！！！', 1, 1, '2020-09-04 23:00:15');
INSERT INTO `discuss_post` VALUES (7, '一、多画写作第一步:看图构思，明确立意 纵然卡通图画或者图表是千变万化的，但是其基本特征却是相似 的:阁画的立意即使不尽相同，但一定是从图画得出来的。所以，文都 郭老师建议大家:准确把握“图画特点”，明确其背后隐藏的深刻含 义或寓意。 所有图画的特点能够从以下四个方面去总结: 1、中心事物(能够是人，也能够是物): 2、中心事物所处的状态或所处环境: 3、中心事物的动作: 4、动作的结果。 由此，考生在看完图画后，应该明确四个问题: 1.图上画了什么主要人物或事物 2.他或它处于什么状态或环境下 3.他做了什么事或者它表现了什么样的状态 4.他或它所做的事造成了什么结果 二、图画写作第二步:谋篇布局，三段写作 在看明白图画的立意后，就要能够开始着手写作了。任何应试作 文的写作都应从谋篇布局开始，也就是确定文章的整体结构，思考文 章分几段、各段该怎.么写。建议我们把看图议论文写成三个段落:第 —段描述图画，第二段解释寓意，第三段解决方案或我的观点。', 1, 1, '2020-09-24 19:46:50');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `record_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '关于《蒲公英学堂在线》的启用通知', '各学院老师、学生们请注意，由我校开发的《蒲公英学堂在线》已经上线，今后将实现在该平台上进行资料上传。', '2020-09-22 12:50:16');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `num` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `college_id` int(11) NOT NULL DEFAULT 0,
  `telphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `id_card_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `gender` int(11) NOT NULL DEFAULT 0,
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '吴雪莲', '201812200140', 1, '15666668888', '3700404199903043762', 1, 'wuxuelian', '123456');
INSERT INTO `student` VALUES (2, '贾淑晴', '201812200110', 1, '15677885656', '370404199809073714', 1, 'jiashuqing', '123456');
INSERT INTO `student` VALUES (3, '李慧婷', '201812200113', 1, '15678345342', '370404200002033546', 1, 'lihuiting', '123456');
INSERT INTO `student` VALUES (4, '唐璐', '201812200137', 1, '15623423567', '370404199809087635', 1, 'tanglu', '123456');
INSERT INTO `student` VALUES (5, '韩朴琴', '201812200109', 1, '15666666666', '370404199909083452', 1, 'hanpuqin', '123456');
INSERT INTO `student` VALUES (7, '林林林', '201813200149', 3, '15656784567', '370404199906073753', 0, 'linlinlin', '123456');

-- ----------------------------
-- Table structure for student_task
-- ----------------------------
DROP TABLE IF EXISTS `student_task`;
CREATE TABLE `student_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL DEFAULT 0,
  `task_id` int(11) NOT NULL DEFAULT 0,
  `score` int(11) NOT NULL DEFAULT 0,
  `record_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student_task
-- ----------------------------
INSERT INTO `student_task` VALUES (1, 1, 2, 20, '2020-09-24 20:28:53');
INSERT INTO `student_task` VALUES (2, 1, 2, 60, '2020-09-24 22:40:56');
INSERT INTO `student_task` VALUES (3, 1, 3, 60, '2020-09-24 23:00:57');
INSERT INTO `student_task` VALUES (4, 1, 4, 0, '2020-09-24 19:52:16');
INSERT INTO `student_task` VALUES (5, 1, 5, 0, '2020-09-24 19:53:04');
INSERT INTO `student_task` VALUES (6, 1, 1, 40, '2020-09-24 19:59:24');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL DEFAULT 0,
  `course_id` int(11) NOT NULL DEFAULT 0,
  `record_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, 1, 1, '2020-09-24 22:23:24');
INSERT INTO `task` VALUES (5, 1, 1, '2020-09-24 18:41:31');
INSERT INTO `task` VALUES (6, 1, 1, '2020-09-24 18:41:32');
INSERT INTO `task` VALUES (7, 1, 1, '2020-09-24 18:41:33');
INSERT INTO `task` VALUES (9, 1, 1, '2020-09-24 20:16:20');
INSERT INTO `task` VALUES (10, 1, 2, '2020-09-24 20:16:25');
INSERT INTO `task` VALUES (11, 1, 2, '2020-09-25 19:36:39');

-- ----------------------------
-- Table structure for task_question
-- ----------------------------
DROP TABLE IF EXISTS `task_question`;
CREATE TABLE `task_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `item_a` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `item_b` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `item_c` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `item_d` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `answer` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `task_id` int(11) NOT NULL DEFAULT 0,
  `score` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of task_question
-- ----------------------------
INSERT INTO `task_question` VALUES (1, 'MVC三层模式中，C指的是哪一层？', '控制层', '模型层', '视图层', '以上都不是', 'A', 1, 10);
INSERT INTO `task_question` VALUES (2, '以下关于重定向forward说法正确的是？', '重定向时URL不变而且不可传递参数', '重定向时URL会变而且不可传递参数', '重定向时URL不变而且可传递参数', '重定向时URL会变而且可传递参数', 'C', 1, 10);
INSERT INTO `task_question` VALUES (3, '以下关于Http Session会话的说法正确的是？', 'Session对象保存于磁盘中', 'Session存在于服务器内存中', 'Session存在于服务器数据库中', 'session存在于客户端浏览器中', 'B', 1, 10);
INSERT INTO `task_question` VALUES (4, '在MySQL脚本中，查询第一条数据的写法正确的是？', 'LIMIT 1', 'LIMIT 0', 'TOP 1', 'FIRST', 'A', 1, 10);
INSERT INTO `task_question` VALUES (5, 'What’s the mean on the earth road ?', 'YES OR NO', 'NO', 'YES', 'BOTH YES', 'B', 3, 10);
INSERT INTO `task_question` VALUES (6, 'How much dose the sheep on the moution ?', 'Three sheeps in the house.', 'No sheep in the house.', 'Much sheep in the door.', 'Both Wrong', 'C', 3, 10);
INSERT INTO `task_question` VALUES (11, '用于监听 DOM 事件的指令是:', 'v-on', 'v-model', 'v-bind', 'v-html', 'A', 10, 10);
INSERT INTO `task_question` VALUES (12, '用于监听 DOM 事件的指令是:', 'v-on', 'v-model', 'v-bind', 'v-html', 'A', 11, 15);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `gender` int(11) NOT NULL DEFAULT 0,
  `college_id` int(11) NOT NULL DEFAULT 0,
  `telphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `id_card_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `num` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `course_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '李华', 0, 1, '15678905678', '62292319601209012X', 'lihua', '123456', '80012001', 1);
INSERT INTO `teacher` VALUES (8, '李子秋', 1, 3, '15623454565', '370404198709082345', 'liziqiu', '123456', '80012345', 3);

SET FOREIGN_KEY_CHECKS = 1;
