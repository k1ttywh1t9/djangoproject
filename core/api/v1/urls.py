from ninja import Router

from core.api.v1.customers.handlers import router as customers_router
from core.api.v1.products.handlers import router as product_router


router = Router(tags=["v1"])
router.add_router(prefix="products/", router=product_router)
router.add_router(prefix='customers/', router=customers_router)
