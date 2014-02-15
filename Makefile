#PACKAGES="ar-release ar-consumer ar-sync ar-compute ar-local-compute ar-transit ar-api"
PACKAGES=ar-release ar-consumer ar-sync ar-compute ar-local-compute ar-transit ar-api
SRC_DIRS=../ar-release ../log-consumer ../ar-sync ../compute-engine ../ar-transit ../ar-api/package
SPEC_FILES=../ar-release/ar-release.spec ../log-consumer/ar-consumer.spec ../ar-sync/ar-sync.spec ../compute-engine/ar-compute.spec ../compute-engine/ar-local-compute.spec ../ar-transit/ar-transit.spec ../ar-api/package/ar-api.spec
SPRINT=20

sources:
	for i in ${SRC_DIRS}; do cd $$i ; make sources ; done
	cd ../compute-engine; make -f Makefile.local sources ; cd ../builder
	for i in ${SRC_DIRS}; do mv $$i/*.tar.gz . ; done

rpms: sources
	for i in ${PACKAGES}; do rpmbuild -ta --define='dist .${SPRINT}.el6' $$i*gz ; done

clean:
	rm -f *.tar.gz;


