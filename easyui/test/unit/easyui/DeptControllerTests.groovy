package easyui



import org.junit.*
import grails.test.mixin.*

@TestFor(DeptController)
@Mock(Dept)
class DeptControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/dept/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.deptInstanceList.size() == 0
        assert model.deptInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.deptInstance != null
    }

    void testSave() {
        controller.save()

        assert model.deptInstance != null
        assert view == '/dept/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/dept/show/1'
        assert controller.flash.message != null
        assert Dept.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/dept/list'

        populateValidParams(params)
        def dept = new Dept(params)

        assert dept.save() != null

        params.id = dept.id

        def model = controller.show()

        assert model.deptInstance == dept
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/dept/list'

        populateValidParams(params)
        def dept = new Dept(params)

        assert dept.save() != null

        params.id = dept.id

        def model = controller.edit()

        assert model.deptInstance == dept
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/dept/list'

        response.reset()

        populateValidParams(params)
        def dept = new Dept(params)

        assert dept.save() != null

        // test invalid parameters in update
        params.id = dept.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/dept/edit"
        assert model.deptInstance != null

        dept.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/dept/show/$dept.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        dept.clearErrors()

        populateValidParams(params)
        params.id = dept.id
        params.version = -1
        controller.update()

        assert view == "/dept/edit"
        assert model.deptInstance != null
        assert model.deptInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/dept/list'

        response.reset()

        populateValidParams(params)
        def dept = new Dept(params)

        assert dept.save() != null
        assert Dept.count() == 1

        params.id = dept.id

        controller.delete()

        assert Dept.count() == 0
        assert Dept.get(dept.id) == null
        assert response.redirectedUrl == '/dept/list'
    }
}
