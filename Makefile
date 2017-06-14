#--------------------------------------------------------#
#-- created:   2017-6-14 --------------------------------#
#-- author:    Michel Müller ----------------------------#
#-- place:     Tokyo Institute of Technology ------------#
#--------------------------------------------------------#

#--------------------------------------------------------#
#--------  C+CUDA COMPILER AND LINKER SETTINGS ----------#
#--------------------------------------------------------#
CUDA_PATH= /opt/cuda/5.5
CUDA_SDK_PATH= /opt/cuda/5.5/samples

CUDA_COMPILER= nvcc
CUDA_COMPILER_FLAGS= -O3 -arch compute_30
CUDA_LINKER= nvcc
CUDA_LINKER_FLAGS= -O3

#--------------------------------------------------------#
#--------  EXECUTABLES CREATED --------------------------#
#--------------------------------------------------------#
CUDA_EXE = randomaccess

#--------------------------------------------------------#
#--------  MAKE RULES -----------------------------------#
#--------------------------------------------------------#
all: ${CUDA_EXE}

${CUDA_EXE}: ${CUDA_EXE}.o
	${CUDA_LINKER} $< -o $@ ${CUDA_LINKER_FLAGS}

%.o: %.cu
	${CUDA_COMPILER} -c ${CUDA_COMPILER_FLAGS} $< -o $@

clean:
	rm -f ${CUDA_EXE} ${CUDA_EXE} *o *gpu *ptx *hmf*
