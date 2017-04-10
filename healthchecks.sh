set -e
set -x

echo "Checking LMS heartbeat:"
curl http://localhost:18000/heartbeat # LMS
echo
echo "Checking Studio heartbeat:"
curl http://localhost:18010/heartbeat # Studio
echo
echo "Checking ecommerce health:"
curl http://localhost:18130/health/ # Ecommerce
