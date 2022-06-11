// MARK: - Mocks generated from file: SearchAddress/Class/Module/Home/Protocols/HomeProtocols.swift at 2022-06-10 15:57:36 +0000

//
//  HomeProtocols.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/25.
//

// MARK: - View

import Cuckoo
@testable import SearchAddress


 class MockHomeViewProtocol: HomeViewProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = HomeViewProtocol
    
     typealias Stubbing = __StubbingProxy_HomeViewProtocol
     typealias Verification = __VerificationProxy_HomeViewProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: HomeViewProtocol?

     func enableDefaultImplementation(_ stub: HomeViewProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var presenter: HomePresenterProtocol? {
        get {
            return cuckoo_manager.getter("presenter",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.presenter)
        }
        
        set {
            cuckoo_manager.setter("presenter",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.presenter = newValue)
        }
        
    }
    

    

    
    
    
     func applyDesign()  {
        
    return cuckoo_manager.call("applyDesign()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.applyDesign())
        
    }
    

	 struct __StubbingProxy_HomeViewProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var presenter: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockHomeViewProtocol, HomePresenterProtocol> {
	        return .init(manager: cuckoo_manager, name: "presenter")
	    }
	    
	    
	    func applyDesign() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockHomeViewProtocol.self, method: "applyDesign()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_HomeViewProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var presenter: Cuckoo.VerifyOptionalProperty<HomePresenterProtocol> {
	        return .init(manager: cuckoo_manager, name: "presenter", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func applyDesign() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("applyDesign()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class HomeViewProtocolStub: HomeViewProtocol {
    
    
     var presenter: HomePresenterProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (HomePresenterProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
     func applyDesign()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockHomePresenterProtocol: HomePresenterProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = HomePresenterProtocol
    
     typealias Stubbing = __StubbingProxy_HomePresenterProtocol
     typealias Verification = __VerificationProxy_HomePresenterProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: HomePresenterProtocol?

     func enableDefaultImplementation(_ stub: HomePresenterProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var view: HomeViewProtocol? {
        get {
            return cuckoo_manager.getter("view",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.view)
        }
        
        set {
            cuckoo_manager.setter("view",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.view = newValue)
        }
        
    }
    
    
    
     var interactor: HomeInteractorInputProtocol {
        get {
            return cuckoo_manager.getter("interactor",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.interactor)
        }
        
        set {
            cuckoo_manager.setter("interactor",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.interactor = newValue)
        }
        
    }
    
    
    
     var router: HomeRouterProtocol {
        get {
            return cuckoo_manager.getter("router",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.router)
        }
        
        set {
            cuckoo_manager.setter("router",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.router = newValue)
        }
        
    }
    

    

    
    
    
     func viewDidLoad()  {
        
    return cuckoo_manager.call("viewDidLoad()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.viewDidLoad())
        
    }
    
    
    
     func addressRegistrationButtonTapped()  {
        
    return cuckoo_manager.call("addressRegistrationButtonTapped()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.addressRegistrationButtonTapped())
        
    }
    
    
    
     func addressListButtonTapped()  {
        
    return cuckoo_manager.call("addressListButtonTapped()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.addressListButtonTapped())
        
    }
    

	 struct __StubbingProxy_HomePresenterProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var view: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockHomePresenterProtocol, HomeViewProtocol> {
	        return .init(manager: cuckoo_manager, name: "view")
	    }
	    
	    
	    var interactor: Cuckoo.ProtocolToBeStubbedProperty<MockHomePresenterProtocol, HomeInteractorInputProtocol> {
	        return .init(manager: cuckoo_manager, name: "interactor")
	    }
	    
	    
	    var router: Cuckoo.ProtocolToBeStubbedProperty<MockHomePresenterProtocol, HomeRouterProtocol> {
	        return .init(manager: cuckoo_manager, name: "router")
	    }
	    
	    
	    func viewDidLoad() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockHomePresenterProtocol.self, method: "viewDidLoad()", parameterMatchers: matchers))
	    }
	    
	    func addressRegistrationButtonTapped() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockHomePresenterProtocol.self, method: "addressRegistrationButtonTapped()", parameterMatchers: matchers))
	    }
	    
	    func addressListButtonTapped() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockHomePresenterProtocol.self, method: "addressListButtonTapped()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_HomePresenterProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var view: Cuckoo.VerifyOptionalProperty<HomeViewProtocol> {
	        return .init(manager: cuckoo_manager, name: "view", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var interactor: Cuckoo.VerifyProperty<HomeInteractorInputProtocol> {
	        return .init(manager: cuckoo_manager, name: "interactor", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var router: Cuckoo.VerifyProperty<HomeRouterProtocol> {
	        return .init(manager: cuckoo_manager, name: "router", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func viewDidLoad() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("viewDidLoad()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func addressRegistrationButtonTapped() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("addressRegistrationButtonTapped()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func addressListButtonTapped() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("addressListButtonTapped()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class HomePresenterProtocolStub: HomePresenterProtocol {
    
    
     var view: HomeViewProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (HomeViewProtocol?).self)
        }
        
        set { }
        
    }
    
    
     var interactor: HomeInteractorInputProtocol {
        get {
            return DefaultValueRegistry.defaultValue(for: (HomeInteractorInputProtocol).self)
        }
        
        set { }
        
    }
    
    
     var router: HomeRouterProtocol {
        get {
            return DefaultValueRegistry.defaultValue(for: (HomeRouterProtocol).self)
        }
        
        set { }
        
    }
    

    

    
     func viewDidLoad()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func addressRegistrationButtonTapped()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func addressListButtonTapped()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockHomeInteractorInputProtocol: HomeInteractorInputProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = HomeInteractorInputProtocol
    
     typealias Stubbing = __StubbingProxy_HomeInteractorInputProtocol
     typealias Verification = __VerificationProxy_HomeInteractorInputProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: HomeInteractorInputProtocol?

     func enableDefaultImplementation(_ stub: HomeInteractorInputProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var output: HomeInteractorOutputProtocol? {
        get {
            return cuckoo_manager.getter("output",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.output)
        }
        
        set {
            cuckoo_manager.setter("output",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.output = newValue)
        }
        
    }
    

    

    

	 struct __StubbingProxy_HomeInteractorInputProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var output: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockHomeInteractorInputProtocol, HomeInteractorOutputProtocol> {
	        return .init(manager: cuckoo_manager, name: "output")
	    }
	    
	    
	}

	 struct __VerificationProxy_HomeInteractorInputProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var output: Cuckoo.VerifyOptionalProperty<HomeInteractorOutputProtocol> {
	        return .init(manager: cuckoo_manager, name: "output", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class HomeInteractorInputProtocolStub: HomeInteractorInputProtocol {
    
    
     var output: HomeInteractorOutputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (HomeInteractorOutputProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
}



 class MockHomeInteractorOutputProtocol: HomeInteractorOutputProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = HomeInteractorOutputProtocol
    
     typealias Stubbing = __StubbingProxy_HomeInteractorOutputProtocol
     typealias Verification = __VerificationProxy_HomeInteractorOutputProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: HomeInteractorOutputProtocol?

     func enableDefaultImplementation(_ stub: HomeInteractorOutputProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    

	 struct __StubbingProxy_HomeInteractorOutputProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	}

	 struct __VerificationProxy_HomeInteractorOutputProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	}
}

 class HomeInteractorOutputProtocolStub: HomeInteractorOutputProtocol {
    

    

    
}



 class MockHomeRouterProtocol: HomeRouterProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = HomeRouterProtocol
    
     typealias Stubbing = __StubbingProxy_HomeRouterProtocol
     typealias Verification = __VerificationProxy_HomeRouterProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: HomeRouterProtocol?

     func enableDefaultImplementation(_ stub: HomeRouterProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func pushAddressRegistrationViewController()  {
        
    return cuckoo_manager.call("pushAddressRegistrationViewController()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.pushAddressRegistrationViewController())
        
    }
    
    
    
     func pushAddressListViewController()  {
        
    return cuckoo_manager.call("pushAddressListViewController()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.pushAddressListViewController())
        
    }
    

	 struct __StubbingProxy_HomeRouterProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func pushAddressRegistrationViewController() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockHomeRouterProtocol.self, method: "pushAddressRegistrationViewController()", parameterMatchers: matchers))
	    }
	    
	    func pushAddressListViewController() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockHomeRouterProtocol.self, method: "pushAddressListViewController()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_HomeRouterProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func pushAddressRegistrationViewController() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("pushAddressRegistrationViewController()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func pushAddressListViewController() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("pushAddressListViewController()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class HomeRouterProtocolStub: HomeRouterProtocol {
    

    

    
     func pushAddressRegistrationViewController()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func pushAddressListViewController()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

