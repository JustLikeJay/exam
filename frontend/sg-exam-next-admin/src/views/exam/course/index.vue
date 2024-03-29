<template>
  <div>
    <BasicTable @register="registerTable">
      <template #toolbar>
        <a-button v-if="hasPermission(['exam:course:add'])" type="primary" @click="handleCreate">
          {{ t('common.addText') }}
        </a-button>
      </template>
      <template #action="{ record }">
        <TableAction
          :actions="[
            {
              icon: 'ant-design:align-right-outlined',
              tooltip: '章节管理',
              onClick: handleEditChapter.bind(null, record),
              auth: 'exam:course:edit'
            },
            {
              icon: 'ant-design:user-outlined',
              tooltip: '学员管理',
              onClick: handleEditMembers.bind(null, record),
              auth: 'exam:course:edit'
            },
            {
              icon: 'ant-design:like-outlined',
              tooltip: '评价管理',
              onClick: handleEditEvaluate.bind(null, record),
              auth: 'exam:course:edit'
            },
            {
              icon: 'clarity:note-edit-line',
              tooltip: t('common.editText'),
              onClick: handleEdit.bind(null, record),
              auth: 'exam:course:edit'
            },
            {
              icon: 'ant-design:delete-outlined',
              tooltip: t('common.delText'),
              color: 'error',
              auth: 'exam:course:del',
              popConfirm: {
                title: t('common.confirmDelText'),
                confirm: handleDelete.bind(null, record),
              },
            },
          ]"
        />
      </template>
    </BasicTable>
    <CourseModal @register="registerModal" @success="handleSuccess"/>
    <CourseImageModal @register="registerImageModal" @success="handleUploadSuccess"/>
    <EvaluateModal @register="registerEvaluateModal"/>
    <MemberModal @register="registerMemberModal"></MemberModal>
  </div>
</template>
<script lang="ts">
import {defineComponent} from 'vue';
import {BasicTable, TableAction, useTable} from '/@/components/Table';
import {deleteCourse, getCourseList} from '/@/api/exam/course';
import {useModal} from '/@/components/Modal';
import CourseModal from './CourseModal.vue';
import CourseImageModal from './CourseImageModal.vue';
import EvaluateModal from './EvaluateModal.vue';
import MemberModal from './MemberModal.vue';
import {columns, searchFormSchema} from './course.data';
import {useI18n} from '/@/hooks/web/useI18n';
import {usePermission} from '/@/hooks/web/usePermission';
import {useGo} from "/@/hooks/web/usePage";
import {useMessage} from "/@/hooks/web/useMessage";

export default defineComponent({
  name: 'CourseManagement',
  components: {BasicTable, CourseModal, CourseImageModal, EvaluateModal, MemberModal, TableAction},
  setup() {
    const {t} = useI18n();
    const {hasPermission} = usePermission();
    const {createMessage} = useMessage();
    const [registerModal, {openModal}] = useModal();
    const [registerImageModal] = useModal();
    const [registerEvaluateModal, {openModal: openEvaluateModal}] = useModal();
    const [registerMemberModal, {openModal: openMemberModal}] = useModal();
    const go = useGo();
    const [registerTable, {reload}] = useTable({
      title: t('common.modules.exam.course') + t('common.list'),
      api: getCourseList,
      columns,
      formConfig: {
        labelWidth: 120,
        schemas: searchFormSchema,
      },
      pagination: true,
      striped: false,
      useSearchForm: true,
      showTableSetting: true,
      bordered: true,
      showIndexColumn: false,
      canResize: false,
      actionColumn: {
        width: 200,
        title: t('common.operationText'),
        dataIndex: 'action',
        slots: {customRender: 'action'},
        fixed: undefined,
      },
    });

    function handleCreate() {
      openModal(true, {
        isUpdate: false,
      });
    }

    function handleEdit(record: Recordable) {
      openModal(true, {
        record,
        isUpdate: true,
      });
    }

    function handleEditChapter(record: Recordable) {
      go('/exam/course_chapter/' + record.id);
    }

    function handleEditEvaluate(record: Recordable) {
      openEvaluateModal(true, {
        record,
        isUpdate: true,
        courseId: record.id
      });
    }

    function handleEditMembers(record: Recordable) {
      openMemberModal(true, {
        record,
        isUpdate: true,
        courseId: record.id
      });
    }

    async function handleDelete(record: Recordable) {
      await deleteCourse(record.id);
      createMessage.success(t('common.operationSuccessText'));
      await reload();
    }

    function handleSuccess() {
      createMessage.success(t('common.operationSuccessText'));
      reload();
    }

    function handleUploadSuccess() {
      reload();
    }

    return {
      t,
      hasPermission,
      registerTable,
      registerModal,
      registerImageModal,
      registerEvaluateModal,
      registerMemberModal,
      handleCreate,
      handleEdit,
      handleEditChapter,
      handleEditEvaluate,
      handleEditMembers,
      handleDelete,
      handleSuccess,
      handleUploadSuccess,
    };
  },
});
</script>
