if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
	MESSAGE( STATUS ">> Chose gcc compiler" )
	set( CMAKE_CXX_FLAGS         "${CMAKE_CXX_FLAGS} -std=c++11" )
	set( CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} -static -pthread" )
	# set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS}    "-O3")
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
	if ( BUILD_UI_WEB)
		MESSAGE( STATUS ">> Chose clang emcc compiler" )
		set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -O2 -Wno-warn-absolute-paths" )
		set( INTERFACE_EXPORT_FUNCTIONS
			 '_performIteration' '_getSpinDirections'  '_createSimulation'
			 '_DomainWall' '_Homogeneous' '_PlusZ' '_MinusZ' '_Random'  '_Skyrmion' '_SpinSpiral'
			 '_Hamiltonian_Boundary_Conditions' '_Hamiltonian_mu_s' '_Hamiltonian_Field'
			 '_Hamiltonian_Exchange' '_Hamiltonian_DMI' '_Hamiltonian_Anisotropy'
			 '_Hamiltonian_STT' '_Hamiltonian_Temperature')
		string( REPLACE ";" ", " INTERFACE_EXPORT_FUNCTIONS_STRING "${INTERFACE_EXPORT_FUNCTIONS}")
		set( CMAKE_EXE_LINKER_FLAGS 	"${CMAKE_EXE_LINKER_FLAGS} -O2 -s ALLOW_MEMORY_GROWTH=1 -s EXPORTED_FUNCTIONS=\"[${INTERFACE_EXPORT_FUNCTIONS_STRING}]\"" )
	else ()
		MESSAGE( STATUS ">> Chose clang compiler" )
		set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11" )
		# set( CMAKE_EXE_LINKER_FLAGS 	"${CMAKE_EXE_LINKER_FLAGS} -pthread" ) 
		# set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS}    "-O3")
	endif ()
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
	MESSAGE( STATUS ">> Chose MSV compiler" )
	# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /O2")
# elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
endif()
### Print flags info
MESSAGE( STATUS ">> CMAKE_CXX_COMPILER_ID:         " ${CMAKE_CXX_COMPILER_ID} )
MESSAGE( STATUS ">> CMAKE_CXX_FLAGS:               " ${CMAKE_CXX_FLAGS} )
MESSAGE( STATUS ">> CMAKE_EXE_LINKER_FLAGS:        " ${CMAKE_EXE_LINKER_FLAGS} )
