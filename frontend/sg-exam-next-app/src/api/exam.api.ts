import api from './api'

class examApi {

    async examinationList(data) {
        return api.fetchExam<Sg.ExamInfo>("/v1/examination/userExaminationList", data, "GET")
    }

    async examinationDetail(id: string | undefined) {
        return api.fetchExam<Sg.ExamInfo>("/v1/examination/" + id + "/detail", {}, "GET")
    }

    async userFavorites(data) {
        return api.fetchExam<Sg.ExamInfo>("/v1/favorites/user/favorites", data, "GET")
    }

    // 开始考试
    async startExam(examinationId: string | undefined, userId: string) {
        return api.fetchExam<Sg.ExamInfo>("/v1/examRecord/start", {
            examinationId,
            userId
        }, "POST")
    }

    // 获取题目
    async allSubjects(recordId: string) {
        return api.fetchExam<Sg.ExamInfo>("/v1/examRecord/allSubjects/" + recordId, {}, "GET")
    }

    async getSubjects(params: object) {
        return api.fetchExam<Sg.ExamInfo>("/v1/subjects/subjectList", params, "GET")
    }

    async getSubjectDetail(id: string, params: object) {
        return api.fetchExam<Sg.ExamInfo>("/v1/subjects/" + id, params, "GET")
    }

    async getNextSubjectByCategoryId(categoryId: string, subjectId: string, nextType: string, random: boolean = false, realTimeIds: object) {
        return api.fetchExam<Sg.ExamInfo>("/v1/answer/nextSubjectByCategoryId", {
            categoryId,
            subjectId,
            nextType,
            findFav: true,
            view: true,
            random,
            realTimeIds
        }, "POST")
    }

    async saveAndNext(data: object, type: string, nextSubjectSortNo: string = '') {
        return api.fetchExam<Sg.ExamInfo>("/v1/answer/saveAndNext?type=" + type + '&nextSubjectSortNo=' + nextSubjectSortNo, data, "POST")
    }

    // 提交考试
    async submit(data: object) {
        return api.fetchExam<Sg.ExamInfo>("/v1/answer/submit", data, "POST")
    }

    // 提交考试
    async submitAllSubjects(data: object) {
        return api.fetchExam<Sg.ExamInfo>("/v1/answer/submitAll", data, "POST")
    }

    async duration(startTime: string) {
        return api.fetchExam<Sg.ExamInfo>("/v1/examRecord/duration?startTime=" + startTime, {}, "GET")
    }

    async favoriteExam(userId: string, id: string, type: string) {
        return api.fetchExam<Sg.ExamInfo>("/v1/favorites/favExam/" + id + "?userId=" + userId + "&type=" + type, {}, "POST");
    }

    async favoriteCourse(userId: string, id: string, type: string) {
        return api.fetchExam<Sg.ExamInfo>("/v1/favorites/favCourse/" + id + "?userId=" + userId + "&type=" + type, {}, "POST");
    }

    async favoriteSubject(userId: string, id: string, type: string) {
        return api.fetchExam<Sg.ExamInfo>("/v1/favorites/favSubject/" + id + "?userId=" + userId + "&type=" + type, {}, "POST");
    }

    async courseList(params: object) {
        return api.fetchExam<Sg.ExamInfo>("/v1/course/userCourseList", params, "GET");
    }

    async popularCourses() {
        return api.fetchExam<Sg.ExamInfo>("/v1/course/popularCourses", {}, "GET");
    }

    async courseDetail(id: string) {
        return api.fetchExam<Sg.ExamInfo>("/v1/course/detail/" + id, {}, "GET");
    }

    async joinCourse(id: string | undefined, type: string) {
        return api.fetchExam<Sg.ExamInfo>("/v1/course/" + id + "/join?type=" + type, {}, "POST");
    }

    async courseEvaluate(id: string | undefined, params: object) {
        return api.fetchExam<Sg.ExamInfo>("/v1/evaluate/list?courseId=" + id, params, "GET");
    }

    async addEvaluate(data: object) {
        return api.fetchExam<Sg.ExamInfo>("/v1/evaluate", data, "POST");
    }

    async getSectionDetail(id: string) {
        return api.fetchExam<Sg.ExamInfo>("/v1/section/watchSection/" + id, {}, "GET");
    }

    async getPointDetail(id: string) {
        return api.fetchExam<Sg.ExamInfo>("/v1/knowledgePoint/detail/" + id, {}, "GET");
    }

    async categoryTreeWithSubjectCnt() {
        return api.fetchExam<Sg.ExamInfo>("/v1/subjectCategory/categoryTreeWithSubjectCnt", {
            status: 1
        }, "GET");
    }

    async getSubjectCntByParentId(parentId: string) {
        return api.fetchExam<Sg.ExamInfo>("/v1/subjectCategory/getSubjectCntByParentId?parentId=" + parentId, {}, "GET");
    }

    async getCategoryInfo(id: string) {
        return api.fetchExam<Sg.ExamInfo>("/v1/subjectCategory/getCategoryInfo?id=" + id, {}, "GET");
    }
}

export default new examApi()