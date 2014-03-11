PACKAGES=ar-release ar-consumer ar-sync ar-compute ar-local-compute ar-api
SRC_DIRS=../ar-release ../ar-consumer ../ar-sync ../ar-compute-engine ../ar-web-api
SPEC_FILES=../ar-release/ar-release.spec ../ar-consumer/ar-consumer.spec ../ar-sync/ar-sync.spec ../ar-compute-engine/ar-compute.spec ../ar-compute-engine/ar-local-compute.spec ../ar-web-api/ar-api.spec

SPRINT=22

sources:
	for i in ${SRC_DIRS}; do cd $$i ; make sources ; done
	cd ../ar-compute-engine; make -f Makefile.local sources ; cd ../ar-builder
	for i in ${SRC_DIRS}; do mv $$i/*.tar.gz . ; done

rpms: sources
	for i in ${PACKAGES}; do rpmbuild -ta --define='dist .${SPRINT}.el6' $$i*gz ; done

clean:
	rm -f *.tar.gz;


